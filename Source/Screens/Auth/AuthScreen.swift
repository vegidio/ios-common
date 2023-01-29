//
//  AuthScreen.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-19.
//

import SwiftUI
import SwinjectAutoregistration

private struct TokenInfo: View {
    let token: Token

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Access Token:").bold()
                Text(token.accessToken)
            }

            HStack {
                Text("Refresh Token:").bold()
                Text(token.refreshToken)
            }
        }
    }
}

internal struct AuthScreen: View {
    @ObservedObject private var viewModel: AuthViewModel

    @State private var email = ""
    @State private var password = ""

    init(viewModel: AuthViewModel = di~>) {
        self.viewModel = viewModel
    }

    var body: some View {
        Form {
            Section(header: Text("Credentials")) {
                TextField("E-mail", text: $email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)

                SecureField("Password", text: $password)

                Button("Login") {
                    viewModel.login(email: email, password: password)
                }
                .frame(maxWidth: .infinity)
                .disabled(email.isEmpty || password.isEmpty)
            }

            if let token = viewModel.token {
                Section(header: Text("Current User")) {
                    TokenInfo(token: token)

                    Button("Logout") {
                        viewModel.logout()
                    }
                    .frame(maxWidth: .infinity)
                }
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
