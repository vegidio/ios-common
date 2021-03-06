//
//  Dependencies.swift
//  iOS Common
//
//  Created by Vinícius Egidio on 2020-12-17.
//  Copyright © 2020 vinicius.io - All rights reserved.
//

import Foundation
import SAKUtil
import Swinject

extension Container: SAKUtil.Resolver {}

// swiftlint:disable:next identifier_name
internal let di: Container = {
    let container = Container()

    // MARK: - ViewModels

    container.register(UserListViewModel.self) { _ in UserListViewModel() }

    container.register(UserViewModel.self) { _ in UserViewModel() }

    // MARK: - Services

    container.register(CommonService.self) { _ in
        CommonService().apply {
            $0.headers["X-Parse-Application-Id"] = "common"
        }
    }.inObjectScope(.container)

    return container
}()