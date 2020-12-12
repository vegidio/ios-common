//
//  UserListScreen.swift
//  iOS Common
//
//  Created by Vinícius Egidio on 2020-12-12.
//  Copyright © 2020 vinicius.io - All rights reserved.
//

import SwiftUI

internal struct UserListScreen: View {
    @ObservedObject private var viewModel = UserListViewModel()

    var body: some View {
        List {
            ForEach(viewModel.users, id: \.objectId) { user in
                UserListRow(user: user)
            }
        }
        .onAppear {
            viewModel.fetchUsers()
        }
        .navigationBarTitle("User List")
    }
}

private struct UserListScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserListScreen()
    }
}
