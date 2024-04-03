//
//  UserInfoView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/3/24.
//

import SwiftUI

struct UserInfoView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var viewModel = UserInfoViewModel()

    var username: String
    
    var body: some View {
        
        NavigationStack {
            
            Text("Hello \(viewModel.user!.login)")
                .toolbar { Button("Dismiss") { dismiss() } }
                .onAppear { viewModel.getUserInfo(username: username) }
        }
        .background(Color(.systemBackground))
        
    }
}

#Preview {
    UserInfoView(username: MockData.sampleFollower.login)
}
