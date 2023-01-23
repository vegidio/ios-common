//
//  Auth.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-19.
//

import Foundation

internal struct Auth: Codable {
    enum CodingKeys: CodingKey {
        case jwt
        case user
    }

    var jwt: String
    var user: User

    // MARK: - Codable Protocol

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        jwt = try values.decode(String.self, forKey: .jwt)
        user = try values.decode(User.self, forKey: .user)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(jwt, forKey: .jwt)
        try container.encode(user, forKey: .user)
    }
}
