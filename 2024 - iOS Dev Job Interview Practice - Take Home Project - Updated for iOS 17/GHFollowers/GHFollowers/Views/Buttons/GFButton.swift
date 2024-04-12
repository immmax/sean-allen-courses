//
//  GFButton.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/29/24.
//

import SwiftUI

struct GFButton: View {
    
    let title:              LocalizedStringKey
    let systemImageName:    String
    let color:              Color
    
    let action: () -> Void

    
    init(_ title: LocalizedStringKey, systemImageName: String = "arrowshape.right.circle", color: Color = .gray, action: @escaping () -> Void = {}) {
        self.title              = title
        self.systemImageName    = systemImageName
        self.color              = color
        self.action             = action
    }
    
    
    var body: some View {
        
        Button(action: action) {
            Label(title, systemImage: systemImageName)
                .frame(maxWidth: .infinity, minHeight: 40)
        }
        .buttonStyle(.bordered)
        .tint(color)
    }
}


#Preview {
    GFButton("Press me", color: .green, action: {})
}
