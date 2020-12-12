//
//  CommonService.swift
//  iOS Common
//
//  Created by Vinícius Egidio on 2020-12-12.
//  Copyright © 2020 vinicius.io - All rights reserved.
//

import Combine
import Foundation
import SAKNetwork

internal class CommonService: RestFactory<CombineResponse> {
    private let baseUrl = "https://parse.vinicius.io/app/common"

    func getUsers() -> AnyPublisher<Response<User>, Error> {
        let url = "\(baseUrl)/classes/_User"
        return sendRequest(.get, url)
    }
}