//
//  UserScreen.swift
//  iOS Common
//
//  Created by Vinícius Egidio on 2020-12-16.
//  Copyright © 2020 vinicius.io - All rights reserved.
//

import SwiftUI

internal struct UserScreen: View {
    let objectId: String

    @ObservedObject private var viewModel = UserViewModel()

    var body: some View {
        List {
            UserField(label: "Object ID", value: viewModel.user.objectId ?? "")
            UserField(label: "Created At", value: viewModel.user.createdAt?.description ?? "")
            UserField(label: "Username", value: viewModel.user.username ?? "")
            UserField(label: "Age", value: viewModel.user.age?.description ?? "")
            UserField(label: "Verified", value: viewModel.user.emailVerified.description)
        }
        .onAppear { viewModel.fetchUserById(objectId: objectId) }
        .navigationBarTitle("User")
    }
}

internal struct UserScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserScreen(objectId: "123")
    }
}
