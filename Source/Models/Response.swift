//
//  Response.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-29.
//

import Foundation

internal struct Response<T: Codable>: Codable {
    enum CodingKeys: CodingKey {
        case data
    }

    var data: T

    // MARK: - Codable Protocol

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decode(T.self, forKey: .data)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
    }
}
