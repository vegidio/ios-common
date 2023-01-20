//
//  AuthScreen.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-19.
//

import SwiftUI

internal struct AuthScreen: View {
    @StateObject private var viewModel: AuthViewModel

    @State private var username = ""
    @State private var password = ""

    // swiftlint:disable:next force_unwrapping
    init(viewModel: AuthViewModel = di.resolve(AuthViewModel.self)!) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Form {
            Section(header: Text("Credentials")) {
                TextField("Username", text: $username)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)

                SecureField("Password", text: $password)

                Button("Login") {
                    viewModel.login(username: username, password: password)
                }
                .frame(maxWidth: .infinity)
            }

            Section(header: Text("Current User")) {
                Text(viewModel.auth?.jwt ?? "---")
            }
        }
        .onAppear {
            UITextField.appearance().clearButtonMode = .whileEditing
        }
        .navigationTitle("Authentication")
    }
}

internal struct AuthScreen_Previews: PreviewProvider {
    static var previews: some View {
        AuthScreen()
    }
}
