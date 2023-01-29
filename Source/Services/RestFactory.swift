//
//  RestFactory.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-16.
//

import Alamofire
import Combine
import Foundation

internal class RestFactory {
    private let baseUrl: URL
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    private let queue = DispatchQueue.global(qos: .background)

    init(
        baseUrl: String,
        encoder: JSONEncoder = JSONEncoder(),
        decoder: JSONDecoder = JSONDecoder()
    ) {
        guard let url = URL(string: baseUrl) else {
            fatalError("The base URL is invalid.")
        }

        encoder.dateEncodingStrategy = .iso8601
        decoder.dateDecodingStrategy = .iso8601Complete

        self.baseUrl = url
        self.encoder = encoder
        self.decoder = decoder
    }

    /// Sends a request that doesn't expect a response body
    func sendRequest(
        _ method: HTTPMethod,
        _ uri: String,
        params: (some Encodable)? = nil,
        headers: HTTPHeaders? = nil
    ) -> AnyPublisher<Void, ApiError> {
        let url = baseUrl.appendingPathComponent(uri)
        let paramEncoder = getParameterEncoder(method)

        return AF.request(url, method: method, parameters: params, encoder: paramEncoder, headers: headers)
            .publishUnserialized(queue: queue)
            .value()
            .map { _ in }
            .mapError { ApiError.unknown($0.localizedDescription) }
            .eraseToAnyPublisher()
    }

    /// Sends a requests that expects a response body
    func sendRequest<T: Codable>(
        _ method: HTTPMethod,
        _ uri: String,
        params: (some Encodable)? = nil,
        headers: HTTPHeaders? = nil
    ) -> AnyPublisher<T, ApiError> {
        let url = baseUrl.appendingPathComponent(uri)
        let paramEncoder = getParameterEncoder(method)

        return AF.request(url, method: method, parameters: params, encoder: paramEncoder, headers: headers)
            .publishDecodable(type: T.self, queue: queue, decoder: decoder)
            .value()
            .mapError { ApiError.unknown($0.localizedDescription) }
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
