//
//  FollowerListView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/27/24.
//

import SwiftUI

struct FollowerListView: View {
    @State private var viewModel = FollowersListViewModel()
    
    var username: String
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: viewModel.columns) {
                        ForEach(viewModel.filteredFollowers) { follower in
                            FollowerCell(follower: follower)
                                .onTapGesture {
                                    viewModel.selectedFollower = follower
                                    print(viewModel.selectedFollower!)
                                }
                                .onAppear {
                                    if follower == viewModel.followers.last {
                                        viewModel.page += 1
                                        viewModel.getFollowers(username: username, page: viewModel.page)
                                    }
                                }
                        }
                    }
                    .animation(.default, value: viewModel.filteredFollowers)
                    .transition(.identity)
                }
                .padding(12)
                .navigationTitle(username)
                .navigationBarTitleDisplayMode(.large)
                .searchable(
                    text: $viewModel.searchText,
//                    isPresented: $viewModel.isShowingSearchBar,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Search for a username"
                )
            }
            .task {
                viewModel.getFollowers(username: username, page: viewModel.page)
            }
            
            
            //            if viewModel.isShowingDetail {
            //                AppetizerDetailView(
            //                    appetizer: viewModel.selectedAppetizer!,
            //                    isShowingDetail: $viewModel.isShowingDetail
            //                )
            //            }
            //
            
            
            if viewModel.isLoading {
                
                LoadingView()
                
            } else if viewModel.followers.isEmpty {
                
                GFEmptyStateView(message: EmptyStatesContext.noFollowers)
                
            } else if viewModel.filteredFollowers.isEmpty {
                
                ContentUnavailableView.search
                
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
    FollowerListView(username: "SAllen0400")
}
