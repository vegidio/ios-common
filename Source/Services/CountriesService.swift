//
//  CountriesService.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-29.
//

import Combine
import Foundation
import SAKNetwork

internal protocol CountriesService {
    var headers: [String: String] { get set }

    // MARK: - Auth

    func login(email: String, password: String) -> AnyPublisher<Response<Token>, ApiError>

    // MARK: - Users

    func me() -> AnyPublisher<Response<User>, ApiError>

    // MARK: - Countries

    func countries() -> AnyPublisher<Response<[Country]>, ApiError>
    func country(by code: String) -> AnyPublisher<Response<Country>, ApiError>
}
