//
//  HomeMenuRow.swift
//  iOS Common
//
//  Created by Vinícius Egidio on 2020-12-12.
//  Copyright © 2020 vinicius.io - All rights reserved.
//

import SwiftUI

internal struct HomeMenuRow: View {
    let menuOption: MenuOption

    var body: some View {
        HStack(alignment: .center) {
            Text(menuOption.title)
        }
        .frame(height: 40)
        .frame(maxWidth: .infinity)
    }
}

internal struct HomeMenuRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenuRow(menuOption: MenuOption(title: "Test"))
    }
}
