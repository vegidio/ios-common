//
//  HomeMenuRow.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-16.
//

import SwiftUI

struct HomeMenuRow: View {
    let menuOption: MenuOption
    
    var body: some View {
        HStack(alignment: .center) {
            Text(menuOption.title)
        }
        .frame(height: 40)
        .frame(maxWidth: .infinity)
    }
}

struct HomeMenuRow_Previews: PreviewProvider {
    static var previews: some View {
        let menuOption = MenuOption(title: "Vinicius", destination: EmptyView().toAnyView())
        HomeMenuRow(menuOption: menuOption)
    }
}
