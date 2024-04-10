//
//  FollowerListView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/27/24.
//

import SwiftUI

struct FollowerListView: View {
    @State private var viewModel = FollowersListViewModel()
    
    @State var username: String
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: viewModel.columns) {
                        ForEach(viewModel.filteredFollowers) { follower in
                            FollowerCell(follower: follower)
                                .onAppear {
                                    if follower == viewModel.followers.last {
                                        viewModel.page += 1
                                        viewModel.getFollowers(username: username, page: viewModel.page)
                                    }
                                }
                                .onTapGesture {
                                    viewModel.getUserInfo(username: follower.login)
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
                UserInfoView(user: viewModel.user!, delegate: self)
            }
            
            if viewModel.isLoading {
                
                LoadingView()
                
            } else if viewModel.followers.isEmpty {
                
                GFEmptyStateView(message: EmptyStatesContext.noFollowers)
                
            } else if viewModel.filteredFollowers.isEmpty {
//                #warning("Shows while loading even if there are followers")
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
    FollowerListView(username: "")
}

protocol FollowerListViewDelegate {
    func didRequestFollowers(for username: String)
}

extension FollowerListView: FollowerListViewDelegate {
    func didRequestFollowers(for username: String) {
        self.username = username
        viewModel.followers.removeAll()
        viewModel.page = 1
        viewModel.getFollowers(username: username, page: viewModel.page)
    }
}
