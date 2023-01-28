//
//  AuthService.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-19.
//

import Combine
import Foundation

internal class AuthService: RestFactory {
    func login(username: String, password: String) -> AnyPublisher<Auth, RestError> {
        let params = [
            "identifier": username,
            "password": password
        ]
        return sendRequest(.post, "auth/local", params: params)
    }
}
