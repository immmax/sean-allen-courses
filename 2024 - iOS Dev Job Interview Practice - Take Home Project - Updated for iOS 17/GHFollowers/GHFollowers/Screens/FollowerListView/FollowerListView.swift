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
                                    viewModel.isShowingUserInfo = true
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
                .scrollDismissesKeyboard(.immediately)
                .submitLabel(.search)
            }
            .task {
                viewModel.getFollowers(username: username, page: viewModel.page)
            }
            .sheet(isPresented: $viewModel.isShowingUserInfo) {
                UserInfoView(username: viewModel.selectedFollower!.login)
            }
            
            
            if viewModel.isLoading {
                
                LoadingView()
                
            } else if viewModel.followers.isEmpty {
                
                GFEmptyStateView(message: EmptyStatesContext.noFollowers)
                
            } else if viewModel.filteredFollowers.isEmpty {
                #warning("Shows while loading even if there are followers")
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
