//
//  Inject.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-20.
//

import Foundation

public protocol Resolver {
    func resolve<T>(_ type: T.Type, name: String?) -> T?
}

public enum InjectSettings {
    public static var resolver: Resolver?
}

@propertyWrapper
public struct Inject<T> {
    public private(set) var wrappedValue: T

    public init() {
        self.init(name: nil, resolver: nil)
    }

    public init(name: String? = nil, resolver: Resolver? = nil) {
        guard let resolver = resolver ?? InjectSettings.resolver else {
            fatalError("Make sure InjectSettings.resolver is set!")
        }

        guard let value = resolver.resolve(T.self, name: name) else {
            fatalError("Could not resolve non-optional \(T.self)")
        }

        wrappedValue = value
    }

    public init<Wrapped>(name: String? = nil, resolver: Resolver? = nil) where T == Wrapped? {
        guard let resolver = resolver ?? InjectSettings.resolver else {
            fatalError("Make sure InjectSettings.resolver is set!")
        }

        wrappedValue = resolver.resolve(Wrapped.self, name: name)
    }
}
