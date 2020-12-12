//
//  Response.swift
//  iOS Common
//
//  Created by Vinícius Egidio on 2020-12-12.
//  Copyright © 2020 vinicius.io - All rights reserved.
//

import Foundation

internal struct Response<T: Codable>: Codable {
    var results: [T]

    enum CodingKeys: String, CodingKey {
        case results
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decode([T].self, forKey: .results)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(results, forKey: .results)
    }
}