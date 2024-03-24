//
//  LoadingView.swift
//  Appetizers
//
//  Created by Maxim Datskiy on 3/18/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
//            ProgressView("Loading...")
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.brandPrimary)
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingView()
}
