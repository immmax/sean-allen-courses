
//  FavoriteListView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/27/24.
//

import SwiftUI

struct FavoritesListView: View {
    
    @State private var viewModel = FavoritesListViewModel()
    
    var body: some View {
        NavigationStack {
            
            if viewModel.favorites.isEmpty {
                GFEmptyStateView(message: "No favorites?\nAdd one on the follower screen.")
                    .navigationTitle("Favorites")
            } else {
                List {
                    ForEach(viewModel.favorites) { favoriteUser in
                        NavigationLink(destination: FollowerListView(username: favoriteUser.login)) {
                            FavoriteCell(favorite: favoriteUser)
                        }
                        .swipeActions {
                            Button("Delete", systemImage: "trash", role: .destructive) {
                                try? PersistenceManager.updateWith(favorite: favoriteUser, actionType: .remove)
                                print(viewModel.favorites)
                            }
                            .tint(.red)
                        }
                    }
//                    .onDelete(perform: { indexSet in
//                        viewModel.favorites.remove(atOffsets: indexSet)
//                    } )
                    .listRowSeparator(.hidden)
                }
                .animation(.default, value: viewModel.favorites)
                .transition(.opacity)
                .navigationTitle("Favorites")
            }
        }
        .task { viewModel.getFavorites() }
    }
}

#Preview {
    FavoritesListView()
}


