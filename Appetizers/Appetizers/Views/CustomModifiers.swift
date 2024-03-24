//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Maxim Datskiy on 3/22/24.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}

struct  ListCellImageStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
//            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 90)
            .cornerRadius(9)
    }
}
