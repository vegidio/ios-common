//
//  User.swift
//  iOS Common
//
//  Created by Vinícius Egidio on 2020-12-12.
//  Copyright © 2020 vinicius.io - All rights reserved.
//

import Foundation

internal struct User: Codable {
    var objectId: String?
    var createdAt: Date?
    var username: String?
    var emailVerified = false
    var age: Int?

    // MARK: - Codable Protocol

    enum CodingKeys: CodingKey {
        case objectId
        case createdAt
        case username
        case emailVerified
        case age
    }

    init() {}

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        objectId = try values.decode(String.self, forKey: .objectId)
        createdAt = try values.decode(Date.self, forKey: .createdAt)
        username = try values.decode(String.self, forKey: .username)
        emailVerified = try values.decode(Bool.self, forKey: .emailVerified)
        age = try values.decodeIfPresent(Int.self, forKey: .age)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(objectId, forKey: .objectId)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(username, forKey: .username)
        try container.encode(emailVerified, forKey: .emailVerified)
        try container.encode(age, forKey: .age)
    }
}
