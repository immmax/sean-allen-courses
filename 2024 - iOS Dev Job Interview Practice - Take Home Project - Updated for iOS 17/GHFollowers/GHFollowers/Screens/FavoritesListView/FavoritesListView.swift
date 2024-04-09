
//  FavoriteListView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/27/24.
//

import SwiftUI

struct FavoritesListView: View {
    var body: some View {
        NavigationStack {
            Text("Favorite View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.pink)
                .navigationTitle("Favorite")
        }
    }
}

#Preview {
    FavoritesListView()
}
