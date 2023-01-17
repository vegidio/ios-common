//
//  LazyView.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-16.
//

import SwiftUI

/// Lazily initialize a view, allocation its dependencies when a view is presented for the first time. Useful with
/// NavigationLink.
public struct LazyView<Content: View>: View {
    private let build: () -> Content

    public var body: Content {
        build()
    }

    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
}
