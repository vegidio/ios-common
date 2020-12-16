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

internal let container: Container = {
    let container = Container()

    // Services
    container.register(CommonService.self) { _ in
        CommonService().apply {
            $0.headers["X-Parse-Application-Id"] = "common"
        }
    }

    return container
}()
