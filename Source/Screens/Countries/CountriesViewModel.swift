//
//  CountriesViewModel.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-30.
//

import Combine
import Foundation

internal class CountriesViewModel: ObservableObject {
    @Published var countries: [Country] = []
    @Published var state = NetworkState.idle

    private var service: CountriesService
    private var cancellables = Set<AnyCancellable>()

    init(service: CountriesService) {
        self.service = service
    }

    func fetchCountries() {
        // swiftlint:disable:next trailing_closure
        service.countries()
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
            } receiveValue: { countries in
                self.countries = countries
            }
            .store(in: &cancellables)
    }
}
