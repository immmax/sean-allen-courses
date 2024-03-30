//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/30/24.
//

import SwiftUI

struct FollowerCell: View {
    var follower: Follower
    var body: some View {
        VStack(alignment: .center) {
            
            GFAvatarImage(avatarUrl: follower.avatarUrl)
            
            Text(follower.login)
                .font(.headline.bold())
                .padding(.horizontal)
        }
    }
}

#Preview {
    FollowerCell(follower: Follower(id: 1, login: "immmax", avatarUrl: ""))
}
