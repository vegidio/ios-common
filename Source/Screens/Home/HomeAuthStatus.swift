//
//  HomeAuthStatus.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-24.
//

import SwiftUI
import SwinjectAutoregistration

internal struct HomeAuthStatus: View {
    @EnvironmentObject private var router: Router

    var auth: Auth?

    init(auth: Auth? = nil) {
        self.auth = auth
    }

    var body: some View {
        Button {
            router.navPath.append(Destination.auth)
        } label: {
            if let user = auth?.user {
                Label("Logged in: \(user.username)", systemImage: "lock.fill")
                    .foregroundColor(Color.green)
            } else {
                Label("Logged out", systemImage: "lock.open.fill")
                    .foregroundColor(Color.red)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 36)
    }
}

internal struct HomeAuthStatus_Previews: PreviewProvider {
    static var previews: some View {
        HomeAuthStatus()
    }
}
