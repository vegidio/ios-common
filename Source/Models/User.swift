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
        case name
        case username
        case email
    }

    var id: Int
    var name: String
    var username: String
    var email: String

    // MARK: - Codable Protocol

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        username = try values.decode(String.self, forKey: .username)
        email = try values.decode(String.self, forKey: .email)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(username, forKey: .username)
        try container.encode(email, forKey: .email)
    }
}
