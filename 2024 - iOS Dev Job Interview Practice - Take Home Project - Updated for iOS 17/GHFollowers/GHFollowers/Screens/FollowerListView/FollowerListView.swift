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
                                .onAppear     { viewModel.getNextPage(for: follower) }
                                .onTapGesture { viewModel.getUserInfo(username: follower.login) }
                        }
                    }
                    .animation(.default, value: viewModel.filteredFollowers)
                    .transition(.identity)
                }
                .padding(12)
                .disabled(viewModel.isLoading)
                
                .searchable(
                    text:       $viewModel.searchText,
                    placement:  .navigationBarDrawer(displayMode: .always),
                    prompt:     "Search for a username"
                )
                .submitLabel(.search)
                .scrollDismissesKeyboard(.immediately)
                
                .toolbar {
                    Button(action: { viewModel.addToFavorites(for: username) }) {
                        Label("Add to Favorite", systemImage: "plus")
                    }
                }
                
                .sheet(isPresented: $viewModel.isShowingUserInfo) {
                    UserInfoView(user: viewModel.user!, delegate: self)
                }
                .navigationTitle(username)
                .navigationBarTitleDisplayMode(.large)
            }
            .task { viewModel.getFollowers(username: username, page: viewModel.page) }
            
            if viewModel.isLoading {
                LoadingView()
            } else if viewModel.followers.isEmpty {
                GFEmptyStateView(message: EmptyStatesContext.noFollowers)
            } else if viewModel.filteredFollowers.isEmpty {
                #warning("Sometimes shows up while loading even if there are followers")
                ContentUnavailableView.search
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title:         alertItem.title,
                  message:       alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}


#Preview {
    FollowerListView(username: "")
}


extension FollowerListView: UserInfoViewDelegate {
    
    func didRequestFollowers(for username: String) {
        self.username  = username
        viewModel.followers.removeAll()
        viewModel.page = 1
        viewModel.getFollowers(username: username, page: viewModel.page)
    }
}
