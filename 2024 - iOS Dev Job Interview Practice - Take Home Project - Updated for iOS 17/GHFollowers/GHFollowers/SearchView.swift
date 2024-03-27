//
//  SearchView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/27/24.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationStack {
            Text("Search View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchView()
}
