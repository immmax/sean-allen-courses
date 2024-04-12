//
//  GFEmptyStateView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/3/24.
//

import SwiftUI

struct GFEmptyStateView: View {
    
    let message: String?
    
    var body: some View {
        ZStack {
            Image(.emptyStateLogo)
                .resizable()
                .modifier(EmptyStateImageStyle())
            
            Text(message ?? "")
                .modifier(EmptyStateLabelStyle())
        }
        .ignoresSafeArea()
    }
}


#Preview {
    GFEmptyStateView(message: "Empty state message")
}
