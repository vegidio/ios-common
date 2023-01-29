//
//  CountriesService.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-29.
//

import Combine
import Foundation

internal protocol CountriesService {
    // MARK: - Auth
    func login(email: String, password: String) -> AnyPublisher<Response<Token>, ApiError>

    // MARK: - Users
    func me() -> AnyPublisher<Response<User>, ApiError>
}
