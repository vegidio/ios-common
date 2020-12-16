//
//  UserField.swift
//  iOS Common
//
//  Created by Vinícius Egidio on 2020-12-16.
//  Copyright © 2020 vinicius.io - All rights reserved.
//

import SwiftUI

internal struct UserField: View {
    let label: String
    let value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .bold()
                .font(.system(size: 16))

            Text(value)
        }
        .frame(height: 48)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

internal struct UserField_Previews: PreviewProvider {
    static var previews: some View {
        UserField(label: "Label", value: "Value")
    }
}