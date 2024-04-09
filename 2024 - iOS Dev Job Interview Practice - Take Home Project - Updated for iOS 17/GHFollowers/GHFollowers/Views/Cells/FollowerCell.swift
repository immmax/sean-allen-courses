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
            
            GFRemoteImage(urlString: follower.avatarUrl)
                .modifier(CellImageStyle())
            
            Text(follower.login)
                .font(.headline.bold())
                .padding(.bottom, 12)
                .lineLimit(1)
        }
        .padding(10)
    }
}

#Preview {
    FollowerCell(follower: Follower(id: 1, login: "immmax", avatarUrl: ""))
}
