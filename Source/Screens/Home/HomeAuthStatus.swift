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

    var token: Token?

    init(token: Token? = nil) {
        self.token = token
    }

    var body: some View {
        Button {
            router.navPath.append(Destination.auth)
        } label: {
            if token != nil {
                Label("Logged in", systemImage: "lock.fill")
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
