//
//  UserScreen.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-16.
//

import SwiftUI
import SwinjectAutoregistration

private struct UserInfo: View {
    let user: User

    var body: some View {
        Section(header: Text("Current User")) {
            HStack {
                Text("ID:").bold()
                Text(String(user.id))
            }

            HStack {
                Text("Name:").bold()
                Text(String(user.name))
            }

            HStack {
                Text("Username:").bold()
                Text(String(user.username))
            }

            HStack {
                Text("E-mail:").bold()
                Text(String(user.email))
            }
        }
    }
}

internal struct UserScreen: View {
    @ObservedObject private var viewModel: UserViewModel

    init(viewModel: UserViewModel = di~>) {
        self.viewModel = viewModel
    }

    var body: some View {
        Form {
            if let user = viewModel.user {
                UserInfo(user: user)
            }
        }
        .onAppear {
            viewModel.me()
        }
        .navigationTitle("Me")
    }
}

private struct MoviesScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserScreen()
    }
}
