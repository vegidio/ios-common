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
    case user
    case countryByCode
    case countries

    @ViewBuilder
    var view: some View {
        switch self {
        case .auth: LazyView { AuthScreen() }
        case .user: LazyView { UserScreen() }
        default: EmptyView()
        }
    }
}

internal class Router: ObservableObject {
    @Published var navPath = NavigationPath()
}
