//
//  APButton.swift
//  Appetizers
//
//  Created by Maxim Datskiy on 3/21/24.
//

import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding()
    }
}

#Preview {
    APButton(title: "Test Title")
}
