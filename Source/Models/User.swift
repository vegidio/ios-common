//
//  User.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-19.
//

import Foundation

internal struct User: Codable {
    enum CodingKeys: CodingKey {
        case id
        case username
        case email
    }

    var id: Int
    var username: String
    var email: String

    init(id: Int, username: String, email: String) {
        self.id = id
        self.username = username
        self.email = email
    }

    // MARK: - Codable Protocol

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decode(Int.self, forKey: .id)
        username = try values.decode(String.self, forKey: .username)
        email = try values.decode(String.self, forKey: .email)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(username, forKey: .username)
        try container.encode(email, forKey: .email)
    }
}
