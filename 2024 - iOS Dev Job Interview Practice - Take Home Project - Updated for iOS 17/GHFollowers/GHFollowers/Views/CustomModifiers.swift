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
//            .padding(10)
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
