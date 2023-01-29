//
//  GraphqlFactory.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-28.
//

import Apollo
import Combine
import Foundation

internal class GraphqlFactory {
    private let client: ApolloClient
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    private let queue = DispatchQueue.global(qos: .background)

    init(
        url: String,
        encoder: JSONEncoder = JSONEncoder(),
        decoder: JSONDecoder = JSONDecoder()
    ) {
        guard let url = URL(string: url) else {
            fatalError("The API URL is invalid.")
        }

        encoder.dateEncodingStrategy = .iso8601
        decoder.dateDecodingStrategy = .iso8601Complete

        self.client = ApolloClient(url: url)
        self.encoder = encoder
        self.decoder = decoder
    }

    func sendMutation<T: Codable, Mutation: GraphQLMutation>(
        mutation: Mutation,
        type: T.Type
    ) -> AnyPublisher<T, ApiError> {
        Future<T, ApiError> { promise in
            self.client.perform(mutation: mutation, queue: self.queue) { result in
                switch result {
                case let .success(response):
                    let json = response.data?.__data._data
                    let value: T? = self.jsonToCodable(json: json)

                    guard let value else {
                        promise(.failure(.unknown("Nothing")))
                        return
                    }

                    promise(.success(value))

                case let .failure(error):
                    promise(.failure(.unknown(error.localizedDescription)))
                }
            }
        }.eraseToAnyPublisher()
    }

    private func jsonToCodable<T: Codable>(json: JSONObject?) -> T? {
        guard
            let key = json?.first?.key,
            let json = json?[key],
            let jsonData = try? JSONSerialization.data(withJSONObject: json),
            let value = try? decoder.decode(T.self, from: jsonData)
        else {
            return nil
        }

        return value
    }
}
