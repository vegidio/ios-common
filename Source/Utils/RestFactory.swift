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
    case unknown(String)
}

internal class RestFactory {
    var encoder = JSONEncoder()
    var decoder = JSONDecoder()

    private let queue = DispatchQueue.global(qos: .background)

    init() {
        encoder.dateEncodingStrategy = .iso8601
        decoder.dateDecodingStrategy = .iso8601Complete
    }

    /// Sends a request that doesn't expect a response body
    func sendRequest(
        _ method: HTTPMethod,
        _ uri: String,
        params: (some Encodable)? = nil,
        headers: HTTPHeaders? = nil
    ) -> AnyPublisher<Void, RestError> {
        guard let url = URL(string: uri) else {
            return Fail<Void, RestError>(error: .invalidUrl).eraseToAnyPublisher()
        }

        let paramEncoder = getParameterEncoder(method)
        return AF.request(url, method: method, parameters: params, encoder: paramEncoder, headers: headers)
            .publishUnserialized(queue: queue)
            .value()
            .map { _ in }
            .mapError { RestError.unknown($0.localizedDescription) }
            .eraseToAnyPublisher()
    }

    /// Sends a requests that expects a response body
    func sendRequest<T: Codable>(
        _ method: HTTPMethod,
        _ uri: String,
        params: (some Encodable)? = nil,
        headers: HTTPHeaders? = nil
    ) -> AnyPublisher<T, RestError> {
        guard let url = URL(string: uri) else {
            return Fail<T, RestError>(error: .invalidUrl).eraseToAnyPublisher()
        }

        let paramEncoder = getParameterEncoder(method)
        return AF.request(url, method: method, parameters: params, encoder: paramEncoder, headers: headers)
            .publishDecodable(type: T.self, queue: queue, decoder: decoder)
            .value()
            .mapError { RestError.unknown($0.localizedDescription) }
            .eraseToAnyPublisher()
    }

    // MARK: - Private methods

    private func getParameterEncoder(_ method: HTTPMethod) -> ParameterEncoder {
        guard method == .get else {
            return JSONParameterEncoder.default
        }

        return URLEncodedFormParameterEncoder.default
    }
}
