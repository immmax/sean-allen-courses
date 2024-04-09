//
//  GFButton.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/29/24.
//

import SwiftUI

struct GFButton: View {
    
    let title: LocalizedStringKey
    let backgroundColor: Color
    
    var body: some View {
        Text(title)
            .font(.headline)
            .fontWeight(.semibold)
            .frame(width: 250, height: 50)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .tint(.white)
    }
    
    init(_ title: LocalizedStringKey, backgroundColor: Color = .green) {
        self.title = title
        self.backgroundColor = backgroundColor
    }
}

#Preview {
    GFButton("Get")
}
