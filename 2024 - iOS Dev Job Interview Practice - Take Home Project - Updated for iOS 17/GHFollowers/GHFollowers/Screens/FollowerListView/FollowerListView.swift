//
//  FollowerListView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/27/24.
//

import SwiftUI

struct FollowerListView: View {
    @StateObject var viewModel = FollowersListViewModel()
    
    var username: String
    
    var body: some View {
        ZStack {
            NavigationStack {
                Text("Hello, \(username)!")
                    .navigationTitle(username)
    //                .navigationBarTitleDisplayMode(.large)
            }
            .task {
                viewModel.getFollowers(username: username)
            }
            
//            if viewModel.isShowingDetail {
//                AppetizerDetailView(
//                    appetizer: viewModel.selectedAppetizer!,
//                    isShowingDetail: $viewModel.isShowingDetail
//                )
//            }
//            
            if viewModel.isLoading{
//                LoadingView()
                ProgressView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
            )
        }
    }
}

#Preview {
    FollowerListView(username: "")
}
