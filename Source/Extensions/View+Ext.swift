//
//  View+Ext.swift
//  iOS Common
//
//  Created by Vinicius Egidio on 2023-01-16.
//

import SwiftUI

public extension View {
    /// Convert the existing view to AnyView
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}
