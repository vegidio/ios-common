//
//  UserViewModel.swift
//  iOS Common
//
//  Created by Vinícius Egidio on 2020-12-12.
//  Copyright © 2020 vinicius.io - All rights reserved.
//

import Combine
import Foundation
import SAKNetwork
import SAKUtil

internal class UserListViewModel: ObservableObject {
    // MARK: - Dependency Injection

    @Inject private var service: CommonService

    // MARK: - Combine Properties

    @Published var state = NetworkState.idle
    @Published var users = [User]()

    private var disposables = Set<AnyCancellable>()

    func fetchUsers() {
        service.getUsers()
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveSubscription: { _ in
                DispatchQueue.main.async { self.state = .loading }
            })
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.state = .idle
                case let .failure(error):
                    print(error)
                    self.state = .error
                }
            }, receiveValue: { response in
                self.users = response.results
            }).store(in: &disposables)
    }
}
