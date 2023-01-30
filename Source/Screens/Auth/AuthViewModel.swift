//
//  AuthViewModel.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-19.
//

import Combine
import Foundation
import SwinjectAutoregistration

internal class AuthViewModel: ObservableObject {
    @Published var token: Token?
    @Published var state = NetworkState.idle

    private var service: CountriesService
    private var cancellables = Set<AnyCancellable>()

    init(service: CountriesService) {
        self.service = service
    }

    func login(email: String, password: String) {
        // swiftlint:disable:next trailing_closure
        service.login(email: email, password: password)
            .handleEvents(receiveSubscription: { _ in self.state = .loading })
            .map(\.data)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished: self.state = .idle

                case let .failure(error):
                    print(error)
                    self.state = .error(error)
                }
            } receiveValue: { token in
                self.token = token
                self.service.headers["Authorization"] = "Bearer \(token.accessToken)"
            }
            .store(in: &cancellables)
    }

    func logout() {
        token = nil
        service.headers.removeValue(forKey: "Authorization")
    }
}
