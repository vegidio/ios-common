//
//  Token.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-29.
//

import Foundation

internal struct Token: Codable {
    enum CodingKeys: CodingKey {
        case accessToken
        case refreshToken
    }

    var accessToken: String
    var refreshToken: String

    // MARK: - Codable Protocol

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        accessToken = try values.decode(String.self, forKey: .accessToken)
        refreshToken = try values.decode(String.self, forKey: .refreshToken)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(accessToken, forKey: .accessToken)
        try container.encode(refreshToken, forKey: .refreshToken)
    }
}
