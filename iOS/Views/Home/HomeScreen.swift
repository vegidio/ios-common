//
//  HomeScreen.swift
//  iOS Common
//
//  Created by Vinícius Egidio on 2020-12-12.
//  Copyright © 2020 vinicius.io - All rights reserved.
//

import SwiftUI

internal struct MenuOption: Identifiable {
    let id = UUID()
    var title: String
}

internal struct HomeScreen: View {
    private let menuOptions = [
        MenuOption(title: "Users"),
        MenuOption(title: "Posts"),
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(menuOptions) { menuOption in
                    NavigationLink(destination: UserListScreen()) {
                        HomeMenuRow(menuOption: menuOption)
                    }
                }
            }
            .navigationBarTitle("Home")
        }
    }
}

private struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
