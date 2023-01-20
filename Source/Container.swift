//
//  Container.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-20.
//

import Foundation
import Swinject

extension Container: Resolver {}

// swiftlint:disable:next identifier_name
internal let di: Container = {
    let container = Container()

    // MARK: - ViewModels

    container.register(AuthViewModel.self) { _ in AuthViewModel() }

    // MARK: - Services

    container.register(AuthService.self) { _ in AuthService() }

    return container
}()
