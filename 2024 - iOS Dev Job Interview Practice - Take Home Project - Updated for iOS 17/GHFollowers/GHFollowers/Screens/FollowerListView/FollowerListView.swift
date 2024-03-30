//
//  FollowerListView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/27/24.
//

import SwiftUI

struct FollowerListView: View {
    var username: String
    
    var body: some View {
        NavigationStack {
            Text("Hello, \(username)!")
                .navigationTitle(username)
        }
    }
}

#Preview {
    FollowerListView(username: "")
}
