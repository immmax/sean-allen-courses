//
//  LoadingView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/2/24.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ZStack {
            
            Color(.systemBackground)
                .opacity(0.8)
            
            ProgressView()
                .controlSize(.large)
        }
    }
}

#Preview {
    LoadingView()
}
