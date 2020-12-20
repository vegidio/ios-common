//
//  HomeScreen.swift
//  iOS Common
//
//  Created by Vinícius Egidio on 2020-12-12.
//  Copyright © 2020 vinicius.io - All rights reserved.
//

import SAKView
import SwiftUI

internal struct MenuOption: Identifiable {
    let id = UUID()
    var title: String
    var destination: AnyView
}

internal struct HomeScreen: View {
    private let menuOptions = [
        MenuOption(title: "Users", destination: LazyView(UserListScreen()).toAnyView()),
        MenuOption(title: "Posts", destination: LazyView(UserListScreen()).toAnyView()),
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(menuOptions) { menuOption in
                    NavigationLink(destination: menuOption.destination) {
                        HomeMenuRow(menuOption: menuOption)
                    }
                }
            }
            .navigationBarTitle("Home")
        }
    }
}

internal struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
