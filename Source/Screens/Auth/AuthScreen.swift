//
//  AuthScreen.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-19.
//

import SwiftUI
import SwinjectAutoregistration

private struct UserInfo: View {
    let auth: Auth

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Username:").bold()
                Text(auth.user.username)
            }

            HStack {
                Text("E-mail:").bold()
                Text(auth.user.email)
            }

            HStack(alignment: .top) {
                Text("JWT:").bold()
                Text(auth.jwt)
            }
        }
    }
}

internal struct AuthScreen: View {
    @ObservedObject private var viewModel: AuthViewModel

    @State private var username = ""
    @State private var password = ""

    init(viewModel: AuthViewModel = di~>) {
        self.viewModel = viewModel
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
                .disabled(username.isEmpty || password.isEmpty)
            }

            if let auth = viewModel.auth {
                Section(header: Text("Current User")) {
                    UserInfo(auth: auth)

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
