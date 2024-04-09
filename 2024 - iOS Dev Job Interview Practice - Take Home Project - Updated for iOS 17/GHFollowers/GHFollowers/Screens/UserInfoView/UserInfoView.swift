//
//  UserInfoView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/3/24.
//

import SwiftUI

// TODO: add GitHub daily panel

struct UserInfoView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var viewModel = UserInfoViewModel()

    let user: User
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 20) {
                GFUserInfoHeaderView(user: user ?? MockData.emptyUser)
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(maxHeight: 140)
                    .foregroundStyle(.pink)
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(maxHeight: 140)
                    .foregroundStyle(.blue)
            }
            
            Spacer()
                .toolbar { Button("Done") { dismiss() } }
        }
        .padding(.horizontal, 20)
        .redacted(reason: viewModel.isLoading ? .placeholder : [])
        .background(Color(.systemBackground))
    }
}

#Preview {
    UserInfoView(user: MockData.sampleUser)
}
