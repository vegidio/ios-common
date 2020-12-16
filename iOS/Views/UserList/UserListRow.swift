//
//  UserListRow.swift
//  iOS Common
//
//  Created by Vinícius Egidio on 2020-12-13.
//  Copyright © 2020 vinicius.io - All rights reserved.
//

import SwiftUI

internal struct UserListRow: View {
    let user: User

    var body: some View {
        HStack(alignment: .center) {
            Text(user.username ?? "[No Name]")
        }
        .frame(height: 40)
        .frame(maxWidth: .infinity)
    }
}

internal struct UserListRow_Previews: PreviewProvider {
    static var user: User = {
        var user = User()
        user.username = "vegidio"
        user.age = 40
        return user
    }()

    static var previews: some View {
        UserListRow(user: user)
    }
}
