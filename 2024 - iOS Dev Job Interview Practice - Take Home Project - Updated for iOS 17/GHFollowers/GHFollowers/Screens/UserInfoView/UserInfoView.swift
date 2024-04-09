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
                GFUserInfoHeaderView(user: user)
                
                GFInfoCardView(
                    user: user,
                    itemInfoOneType: .repos,
                    countOne: user.publicRepos,
                    itemInfoTwoType: .gists,
                    countTwo: user.publicGists,
                    buttonTitle: "GitHub Profile",
                    backgroundColor: Color(.systemPurple)
                )
                
                GFInfoCardView(
                    user: user,
                    itemInfoOneType: .followers,
                    countOne: user.followers,
                    itemInfoTwoType: .following,
                    countTwo: user.following,
                    buttonTitle: "Get Followers",
                    backgroundColor: Color(.systemGreen)
                )
                
                Text("GitHub since \(user.createdAt.convertToDisplayFormat())")
            }
            .frame(maxHeight: .infinity, alignment: .top)
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
