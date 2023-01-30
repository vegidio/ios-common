//
//  Container.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-20.
//

import Foundation
import Swinject
import SwinjectAutoregistration

// swiftlint:disable:next identifier_name
internal let di: Container = {
    let container = Container()

    // MARK: - Services

    container.register(CountriesService.self, name: "restCountries") { _ in
        CountriesRestService(baseUrl: "https://countries.vinicius.io/api")
    }
    .inObjectScope(.container)

    container.register(CountriesService.self, name: "graphqlCountries") { _ in
        CountriesGraphqlService(url: "https://countries.vinicius.io/graphql")
    }
    .inObjectScope(.container)

    // MARK: - ViewModels

    container.register(AuthViewModel.self) { _ in
        AuthViewModel(service: di ~> (CountriesService.self, name: "restCountries"))
    }
    .inObjectScope(.container)

    container.register(UserViewModel.self) { _ in
        UserViewModel(service: di ~> (CountriesService.self, name: "restCountries"))
    }

    container.register(CountriesViewModel.self) { _ in
        CountriesViewModel(service: di ~> (CountriesService.self, name: "restCountries"))
    }

    return container
}()
