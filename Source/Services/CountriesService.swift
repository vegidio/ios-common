//
//  CountriesService.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-19.
//

import Combine
import Foundation

internal class CountriesService: RestFactory {
    func login(email: String, password: String) -> AnyPublisher<Response<Token>, RestError> {
        let params = [
            "email": email,
            "password": password
        ]
        return sendRequest(.post, "v1/auth/signin", params: params)
    }
}
