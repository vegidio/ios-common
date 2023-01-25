//
//  AuthViewModel.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-19.
//

import Combine
import Foundation

internal class AuthViewModel: ObservableObject {
    @Published var auth: Auth?
    @Published var state = NetworkState.idle

    private let service: AuthService
    private var cancellables = Set<AnyCancellable>()

    init(service: AuthService) {
        self.service = service
    }

    func login(username: String, password: String) {
        // swiftlint:disable:next trailing_closure
        service.login(username: username, password: password)
            .handleEvents(receiveSubscription: { _ in self.state = .loading })
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished: self.state = .idle

                case let .failure(error):
                    print(error)
                    self.state = .error(error)
                }
            } receiveValue: { auth in
                self.auth = auth
            }
            .store(in: &cancellables)
    }

    func logout() {
        auth = nil
    }
}
