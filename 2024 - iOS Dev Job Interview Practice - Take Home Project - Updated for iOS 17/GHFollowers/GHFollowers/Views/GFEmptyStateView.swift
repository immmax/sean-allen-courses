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
                .scaledToFit()
                .scaleEffect(1.3)
                .frame(maxHeight: .infinity, alignment: .bottomTrailing)
                .offset(x: 115)
            
            Text(message ?? "")
                .font(.system(size: 28))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .lineLimit(3, reservesSpace: true)
                .foregroundStyle(Color(.secondaryLabel))
                .padding(.bottom, 250)
                .padding(.horizontal, 20)
        }
        .ignoresSafeArea()
    }
}

struct EmptyStatesContext {
    static let noFollowers = "This user doesn't have any followers yet. Go follow them 😄."
}


#Preview {
    GFEmptyStateView(message: "Test message for empty state")
}
