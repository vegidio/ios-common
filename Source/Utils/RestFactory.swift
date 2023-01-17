//
//  RestFactory.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-16.
//

import Alamofire
import Combine
import Foundation

internal enum RestError: Error {
    case invalidUrl
    case unknown(message: String)
}

internal class RestFactory {
    private let queue = DispatchQueue.global(qos: .background)

    func sendRequest<T: Codable>(
        _ method: HTTPMethod,
        _ uri: String,
        parameters: Parameters? = nil,
        headers: HTTPHeaders? = nil
    ) -> AnyPublisher<T, RestError> {
        guard let url = URL(string: uri) else {
            return Fail<T, RestError>(error: .invalidUrl).eraseToAnyPublisher()
        }

        return AF.request(url, method: method, parameters: parameters, headers: headers)
            .publishDecodable(type: T.self, queue: queue)
            .value()
            .mapError { error in RestError.unknown(message: error.localizedDescription) }
            .eraseToAnyPublisher()
    }
}