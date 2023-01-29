//
//  AuthViewModel.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-19.
//

import Combine
import Foundation

internal class AuthViewModel: ObservableObject {
    @Published var token: Token?
    @Published var state = NetworkState.idle

    private let service: CountriesService
    private var cancellables = Set<AnyCancellable>()

    init(service: CountriesService) {
        self.service = service
    }

    func login(email: String, password: String) {
        // swiftlint:disable:next trailing_closure
        service.login(email: email, password: password)
            .handleEvents(receiveSubscription: { _ in self.state = .loading })
            .map { $0.data }
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
            }
            .store(in: &cancellables)
    }

    func logout() {
        token = nil
    }
}
