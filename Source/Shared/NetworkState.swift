//
//  NetworkState.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-23.
//

import Foundation

internal enum NetworkState {
    case idle
    case loading
    case error(error: Error? = nil)
}
