//
//  CountriesRestService.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-19.
//

import Combine
import Foundation
import SAKNetwork

internal class CountriesRestService: RestFactory, CountriesService {
    func login(email: String, password: String) -> AnyPublisher<Response<Token>, ApiError> {
        let params = [
            "email": email,
            "password": password
        ]
        return sendRequest(.post, "v1/auth/signin", params: params)
    }

    func me() -> AnyPublisher<Response<User>, ApiError> {
        sendRequest(.get, "v1/users/me")
    }

    func countries() -> AnyPublisher<Response<[Country]>, ApiError> {
        sendRequest(.get, "v1/countries")
    }

    func country(by _: String) -> AnyPublisher<Response<Country>, ApiError> {
        Empty().eraseToAnyPublisher()
    }
}
