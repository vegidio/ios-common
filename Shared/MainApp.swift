//
//  MainApp.swift
//  iOS Common
//
//  Created by Vinícius Egidio on 2020-12-11.
//  Copyright © 2020 vinicius.io - All rights reserved.
//

import SAKUtil
import SwiftUI

@main
internal struct MainApp: App {
    init() {
        InjectSettings.resolver = container
    }

    var body: some Scene {
        WindowGroup {
            HomeScreen()
        }
    }
}