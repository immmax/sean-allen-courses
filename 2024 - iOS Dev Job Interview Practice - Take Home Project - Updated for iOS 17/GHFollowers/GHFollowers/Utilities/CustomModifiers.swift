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
            .cornerRadius(10)
    }
}


struct  UserInfoImageStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .cornerRadius(10)
            .frame(height: 100)
    }
}


struct  EmptyStateImageStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .scaleEffect(1.3)
            .frame(maxHeight: .infinity, alignment: .bottomTrailing)
            .offset(x: 115)
    }
}


struct EmptyStateLabelStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 28))
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineLimit(3, reservesSpace: true)
            .foregroundStyle(Color(.secondaryLabel))
            .padding(.bottom, 250)
            .padding(.horizontal, 20)
    }
}


struct RoundedTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .font(.title2)
            .frame(width: 300, height: 55)
            .tint(Color(.label))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray4), lineWidth: 3)
            }
            .multilineTextAlignment(.center)
            .autocorrectionDisabled()
            .autocapitalization(.none)
            .submitLabel(.go)
    }
}
