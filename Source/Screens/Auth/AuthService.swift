//
//  AuthService.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-19.
//

import Combine
import Foundation

internal class AuthService: RestFactory {
    private let baseUrl = "https://movies.vinicius.io/api"

    func login(username: String, password: String) -> AnyPublisher<Auth, RestError> {
        let url = "\(baseUrl)/auth/local"

        let params = [
            "identifier": username,
            "password": password
        ]
        return sendRequest(.post, url, params: params)
    }
}
