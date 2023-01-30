//
//  CountriesScreen.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-30.
//

import SwiftUI
import SwinjectAutoregistration

internal struct CountriesScreen: View {
    @ObservedObject private var viewModel: CountriesViewModel

    init(viewModel: CountriesViewModel = di~>) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text("Hello, World!")
            .onAppear {
                viewModel.fetchCountries()
            }
    }
}

internal struct CountriesScreen_Previews: PreviewProvider {
    static var previews: some View {
        CountriesScreen()
    }
}
