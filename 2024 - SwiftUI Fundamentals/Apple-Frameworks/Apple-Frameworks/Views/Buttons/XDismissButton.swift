//
//  XDismissButton.swift
//  Apple-Frameworks
//
//  Created by Maxim Datskiy on 3/17/24.
//

import SwiftUI

struct XDismissButton: View {
    @Environment(\.dismiss) var dismiss // Instead of binding isShowingDetailView
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .foregroundStyle(Color(.label))
                .imageScale(.large)
                .frame(width: 44, height: 44)
        }
        .frame(maxWidth: .infinity, alignment: .topTrailing)
    }
}

#Preview {
    XDismissButton()
}
