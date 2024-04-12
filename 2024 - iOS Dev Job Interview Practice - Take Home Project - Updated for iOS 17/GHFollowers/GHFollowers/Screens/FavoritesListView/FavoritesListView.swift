
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
            
            ZStack  {
                
                List {
                    ForEach(viewModel.favorites) { favoriteUser in
                        NavigationLink(destination: FollowerListView(username: favoriteUser.login)) {
                            FavoriteCell(favorite: favoriteUser)
                        }
                    }
                    .onDelete { indexSet in
                        viewModel.favorites.remove(atOffsets: indexSet)
                        try? PersistenceManager.save(favorites: viewModel.favorites)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .toolbar {
                    EditButton()
                }
                
                if viewModel.favorites.isEmpty {
                    GFEmptyStateView(message: "No favorites?\nAdd one on the follower screen.")
                        .navigationTitle("Favorites")
                }
            }
            .navigationTitle("Favorites")
            .onAppear { viewModel.getFavorites() }
        }
    }
}

#Preview {
    FavoritesListView()
}


// TODO: - Лучше вместо + сделать ♥️. Если пользователь уже в избранном - закрашивать его. Если надо убрать из избранного - спрашивать, действительно ли хочешь убрать
