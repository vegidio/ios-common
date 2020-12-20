//
//  UserListScreen.swift
//  iOS Common
//
//  Created by Vinícius Egidio on 2020-12-12.
//  Copyright © 2020 vinicius.io - All rights reserved.
//

import SAKView
import SwiftUI

internal struct UserListScreen: View {
    // swiftlint:disable:next force_unwrapping
    @StateObject private var viewModel = di.resolve(UserListViewModel.self)!

    var body: some View {
        List {
            ForEach(viewModel.users, id: \.objectId) { user in
                NavigationLink(destination: LazyView(UserScreen(objectId: user.objectId ?? "-"))) {
                    UserListRow(user: user)
                }
            }
        }
        .onAppear { viewModel.fetchUsers() }
        .navigationBarTitle("User List")
    }
}

internal struct UserListScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserListScreen()
    }
}
