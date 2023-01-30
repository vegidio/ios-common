//
//  Router.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-24.
//

import Foundation
import SAKView
import SwiftUI

internal enum Destination: Codable {
    case auth
    case user
    case countryByCode
    case countries

    @ViewBuilder
    var view: some View {
        switch self {
        case .auth: Lazy { AuthScreen() }
        case .user: Lazy { UserScreen() }
        case .countries: Lazy { CountriesScreen() }
        default: EmptyView()
        }
    }
}

internal class Router: ObservableObject {
    @Published var navPath = NavigationPath()
}
