//
//  HomeScreen.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-16.
//

import SwiftUI
import SwinjectAutoregistration

internal struct MenuOption: Identifiable {
    let id: Destination
    let title: String
}

internal struct HomeScreen: View {
    @EnvironmentObject private var router: Router
    @ObservedObject private var viewModel: AuthViewModel

    private let menuOptions = [
        MenuOption(id: .user, title: "Me"),
        MenuOption(id: .countryByCode, title: "Country By Code"),
        MenuOption(id: .countries, title: "Countries")
    ]

    init(viewModel: AuthViewModel = di~>) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            NavigationStack(path: $router.navPath) {
                List(menuOptions) { option in
                    NavigationLink(destination: option.id.view) {
                        HomeMenuRow(menuOption: option)
                    }
                }
                .navigationDestination(for: Destination.self) { id in
                    id.view
                }
                .navigationTitle("Home")
            }

            HomeAuthStatus(token: viewModel.token)
        }
    }
}

internal struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
