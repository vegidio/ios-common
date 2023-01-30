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
        let mutation = Countries.SignInMutation(dto: Countries.SignInRequestDto(
            email: email,
            password: password
        ))
        return sendMutation(mutation: mutation)
    }

    func me() -> AnyPublisher<Response<User>, ApiError> {
        Empty().eraseToAnyPublisher()
    }

    func countries() -> AnyPublisher<Response<[Country]>, ApiError> {
        Empty().eraseToAnyPublisher()
    }

    func country(by _: String) -> AnyPublisher<Response<Country>, ApiError> {
        Empty().eraseToAnyPublisher()
    }
}
