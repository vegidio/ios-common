//
//  Container.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-20.
//

import Foundation
import Swinject
import SwinjectAutoregistration

// swiftlint:disable:next identifier_name
internal let di: Container = {
    let container = Container()

    // MARK: - Services

    container.register(AuthService.self) { _ in AuthService() }

    // MARK: - ViewModels

    container.autoregister(AuthViewModel.self, initializer: AuthViewModel.init)
        .inObjectScope(.container)

    return container
}()
