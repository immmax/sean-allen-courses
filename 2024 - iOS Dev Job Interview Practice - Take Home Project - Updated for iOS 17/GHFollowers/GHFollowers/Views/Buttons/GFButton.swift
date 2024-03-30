//
//  GFButton.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/29/24.
//

import SwiftUI

struct GFButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 250, height: 50)
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .tint(.white)
    }
}

#Preview {
    GFButton(title: "Get")
}
