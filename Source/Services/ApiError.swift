//
//  ApiError.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-29.
//

import Foundation

internal enum ApiError: Error {
    case invalidUrl
    case unknown(String)
}
