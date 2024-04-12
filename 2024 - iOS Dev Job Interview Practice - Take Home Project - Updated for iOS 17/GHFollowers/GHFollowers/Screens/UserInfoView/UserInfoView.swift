//
//  UserInfoView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/3/24.
//

import SwiftUI

// TODO: add GitHub daily panel


protocol UserInfoViewDelegate {
    func didRequestFollowers(for username: String)
}


struct UserInfoView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var viewModel = UserInfoViewModel()
    let user: User
    var delegate: UserInfoViewDelegate!
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 20) {
                GFUserInfoHeaderView(user: user)
                
                GFRepoItemView(user: user, delegate: self)
                
                GFFollowerItemView(user: user, delegate: self)
                
                Text("GitHub since \(user.createdAt.convertToMonthYearFormat())")
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .toolbar { Button("Done") { dismiss() } }
        }
        .fullScreenCover(isPresented: $viewModel.isShowingSafari) {
            SafariView(url: URL(string: user.htmlUrl)!)
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
        .padding(.horizontal, 20)
        .redacted(reason: viewModel.isLoading ? .placeholder : [])
        .background(Color(.systemBackground))
    }
}

//#Preview {
//    UserInfoView(user: MockData.sampleUser, delegate: )
//}

extension UserInfoView: GFRepoItemViewDelegate {
    func didTapGitHubProfile(for user: User) {
        guard URL(string: user.htmlUrl) != nil else {
            viewModel.alertItem = AlertContext.invalidURL
            return
        }
        
        viewModel.isShowingSafari = true
    }
}

extension UserInfoView: GFFollowerViewDelegate {
    
    func didTapGetFollowers(for user: User) -> Void {
        guard user.followers != 0 else {
            viewModel.alertItem = AlertContext.noFollowers
            return
        }
        delegate.didRequestFollowers(for: user.login)
        dismiss()
    }
}
