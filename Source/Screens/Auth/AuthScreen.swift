//
//  AuthScreen.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-19.
//

import SwiftUI

internal struct AuthScreen: View {
    @StateObject private var viewModel = AuthViewModel()

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                viewModel.login(username: "vinicius", password: "password!")
            }
    }
}

private struct AuthScreen_Previews: PreviewProvider {
    static var previews: some View {
        AuthScreen()
    }
}
