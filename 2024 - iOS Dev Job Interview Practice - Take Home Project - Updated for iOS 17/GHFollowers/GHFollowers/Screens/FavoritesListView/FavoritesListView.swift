
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
                        #warning("NEXT LINE: Need to just update, not rewrite every time. Possible?")
                        try? PersistenceManager.save(favorites: viewModel.favorites)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .toolbar {
                    EditButton()
                }
                
                if viewModel.favorites.isEmpty {
//                    GFEmptyStateView(message: EmptyStatesContext.noFavorites)
                    ContentUnavailableView(
                        "No Favorites",
                        systemImage: "star",
                        description: Text("Add a favorite on the follower list screen")
                    )
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


// TODO: + -> ♥️. If a user is already in Favorites - fill. Wand to delete? - ask to approve
