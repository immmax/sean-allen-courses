//
//  FavoriteCell.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/11/24.
//

import SwiftUI

struct FavoriteCell: View {
    
    var favorite: Follower
    
    var body: some View {
        HStack(alignment: .center, spacing: 24) {
            GFRemoteImage(urlString: favorite.avatarUrl)
                .modifier(CellImageStyle())
                .frame(height: 60)
            
            Text(favorite.login)
                .font(.title.bold())
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                .frame(height: 40)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 12)
    }
}


#Preview {
    FavoriteCell(favorite: MockData.sampleFollower)
}
