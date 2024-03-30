//
//  CustomModifiers.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/30/24.
//

import SwiftUI

struct  CellImageStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 120, height: 120)
            .cornerRadius(10)
            .padding(8)
    }
}
