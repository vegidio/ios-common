//
//  UserViewModel.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-29.
//

import Combine
import Foundation
import SwinjectAutoregistration

internal class UserViewModel: ObservableObject {
    @Published var user: User?
    @Published var state = NetworkState.idle

    private let service: CountriesService
    private var cancellables = Set<AnyCancellable>()

    init(service: CountriesService) {
        self.service = service
    }

    func me() {
        // swiftlint:disable:next trailing_closure
        service.me()
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
            } receiveValue: { user in
                self.user = user
            }
            .store(in: &cancellables)
    }
}
