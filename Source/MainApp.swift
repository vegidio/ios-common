//
//  MainApp.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-16.
//

import SwiftUI

@main
internal struct MainApp: App {
    @StateObject private var router = Router()

    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(router)
        }
    }
}
