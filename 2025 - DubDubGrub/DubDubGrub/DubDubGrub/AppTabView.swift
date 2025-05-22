//
//  AppTabView.swift
//  DubDubGrub
//
//  Created by Maxim Datskiy on 5/21/25.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            LocationMapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            
            LocationsListView()
                .tabItem {
                    Label("Locations", systemImage: "building")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .accentColor(.brandPrimary)
    }
}

#Preview {
    AppTabView()
}
