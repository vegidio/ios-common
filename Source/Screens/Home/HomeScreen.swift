//
//  HomeScreen.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-16.
//

import SwiftUI

internal struct MenuOption: Identifiable {
    let id = UUID()
    var title: String
    var destination: AnyView
}

internal struct HomeScreen: View {
    private let menuOptions = [
        MenuOption(title: "Auth", destination: LazyView(AuthScreen()).toAnyView()),
        MenuOption(title: "Movies", destination: LazyView(MoviesScreen()).toAnyView()),
        MenuOption(title: "Actors", destination: EmptyView().toAnyView()),
        MenuOption(title: "Genres", destination: EmptyView().toAnyView())
    ]

    var body: some View {
        NavigationView {
            List(menuOptions) { option in
                NavigationLink(destination: option.destination) {
                    HomeMenuRow(menuOption: option)
                }
            }
            .navigationTitle("Home")
        }
    }
}

private struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
