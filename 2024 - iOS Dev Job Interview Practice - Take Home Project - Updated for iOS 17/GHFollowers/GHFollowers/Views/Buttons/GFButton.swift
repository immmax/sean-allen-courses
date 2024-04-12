//
//  GFButton.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/29/24.
//

import SwiftUI

struct GFButton: View {
    
    let title:           LocalizedStringKey
    let backgroundColor: Color
    
    init(_ title: LocalizedStringKey, backgroundColor: Color = .green) {
        self.title           = title
        self.backgroundColor = backgroundColor
    }

    var body: some View {
        Text(title)
            .font(.headline)
            .fontWeight(.semibold)
            .tint(.white)
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(10)
    }
}


#Preview {
    GFButton("Get")
}
