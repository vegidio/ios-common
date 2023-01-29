//
//  UserScreen.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-16.
//

import SwiftUI
import SwinjectAutoregistration

internal struct UserScreen: View {
    @ObservedObject private var viewModel: UserViewModel

    init(viewModel: UserViewModel = di~>) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text("USER")
    }
}

private struct MoviesScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserScreen()
    }
}
