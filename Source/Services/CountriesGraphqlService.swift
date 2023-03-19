//
//  CountriesGraphqlService.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-29.
//

import Combine
import Foundation
import SAKNetwork

internal class CountriesGraphqlService: GraphqlFactory, CountriesService {
    func login(email: String, password: String) -> AnyPublisher<Response<Token>, ApiError> {
        // Clear any existing cache
        clearCache()

        let mutation = Countries.SignInMutation(dto: Countries.SignInRequestDto(
            email: email,
            password: password
        ))
        return sendMutation(mutation: mutation)
    }

    func logout() {
        headers.removeValue(forKey: "Authorization")
        clearCache()
    }

    func me() -> AnyPublisher<Response<User>, ApiError> {
        sendQuery(query: Countries.MeQuery())
    }

    func countries() -> AnyPublisher<Response<[Country]>, ApiError> {
        sendQuery(query: Countries.CountriesQuery())
    }

    func country(by code: String) -> AnyPublisher<Response<Country>, ApiError> {
        sendQuery(query: Countries.CountryQuery(code: code))
    }
}
