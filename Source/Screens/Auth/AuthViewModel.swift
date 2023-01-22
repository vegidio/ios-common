//
//  AuthViewModel.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-19.
//

import Combine
import Foundation

internal class AuthViewModel: ObservableObject {
    private let service: AuthService
    private var cancellables = Set<AnyCancellable>()

    @Published var auth: Auth?

    init(service: AuthService) {
        self.service = service
    }

    func login(username: String, password: String) {
        service.login(username: username, password: password)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished: print("Finished")
                case let .failure(error): print("Error: \(error)")
                }
            } receiveValue: { auth in
                self.auth = auth
            }
            .store(in: &cancellables)
    }
}
