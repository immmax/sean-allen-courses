//
//  ContentView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/27/24.
//

import SwiftUI

struct GFTabView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag("0")
            
            FavoritesListView()
                .tabItem {
                    Label("Search", systemImage: "star")
                }
                .tag("1")
        }
        .tint(.green)
    }
}

#Preview {
    GFTabView()
}
