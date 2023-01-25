//
//  Router.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-24.
//

import Foundation
import SwiftUI

internal enum Destination: Codable {
    case auth
    case movies
    case actors
    case genres

    @ViewBuilder
    var view: some View {
        switch self {
        case .auth: LazyView { AuthScreen() }
        case .movies: LazyView { MoviesScreen() }
        default: EmptyView()
        }
    }
}

internal class Router: ObservableObject {
    @Published var navPath = NavigationPath()
}
