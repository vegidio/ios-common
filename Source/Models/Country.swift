//
//  Country.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-30.
//

import Foundation

internal struct Country: Codable {
    struct NativeName: Codable {
        var language: String
        var common: String
        var official: String
    }

    struct Name: Codable {
        var common: String
        var official: String
        var nativeName: [NativeName]
    }

    struct Language: Codable {
        var code: String
        var name: String
    }

    struct Currency: Codable {
        var code: String
        var name: String
        var symbol: String?
    }

    struct Flag: Codable {
        var png: String
        var svg: String
    }

    var code: String
    var capital: String?
    var region: String
    var subRegion: String?
    var languages: [Language]
    var currencies: [Currency]
    var population: Int
    var area: Float
    var coordinates: [Float]
    var flags: Flag
}
