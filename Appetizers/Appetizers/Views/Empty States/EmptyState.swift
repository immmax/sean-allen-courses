//
//  EmptyState.swift
//  Appetizers
//
//  Created by Maxim Datskiy on 3/21/24.
//

import SwiftUI

struct EmptyState: View {
    var imageName: String
    var message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    EmptyState(
        imageName: "empty-order",
        message: "This is our test message.\nI'm making it a little long for testing."
    )
}
