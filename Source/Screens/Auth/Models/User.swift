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
        case createdAt
    }

    var id: Int
    var username: String
    var email: String
    var createdAt: Date

    init(id: Int, username: String, email: String, createdAt: Date) {
        self.id = id
        self.username = username
        self.email = email
        self.createdAt = createdAt
    }

    // MARK: - Codable Protocol

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decode(Int.self, forKey: .id)
        username = try values.decode(String.self, forKey: .username)
        email = try values.decode(String.self, forKey: .email)
        createdAt = try values.decode(Date.self, forKey: .createdAt)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(username, forKey: .username)
        try container.encode(email, forKey: .email)
        try container.encode(createdAt, forKey: .createdAt)
    }
}
