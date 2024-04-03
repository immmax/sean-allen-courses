//
//  UserInfoView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/3/24.
//

import SwiftUI

struct UserInfoView: View {
    @Environment(\.dismiss) var dismiss
    var follower: Follower
    
    var body: some View {
        NavigationStack {
            Text("Hello, \(follower.login)")
                .toolbar {
                    Button {
                        print("UserInfoView Dismissed")
                        dismiss()
                    } label: {
                        Text("Dismiss")
                    }
                }
                
        }
        .background(Color(.systemBackground))
    }
}

#Preview {
    UserInfoView(follower: MockData.sampleFollower)
}
