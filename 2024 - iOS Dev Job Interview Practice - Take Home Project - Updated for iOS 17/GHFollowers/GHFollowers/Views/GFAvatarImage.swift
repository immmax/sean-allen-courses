//
//  GFAvatarImage.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/30/24.
//

import SwiftUI

struct GFAvatarImage: View {

    var avatarUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: avatarUrl), content: { image in
            image
                .resizable()
                .modifier(CellImageStyle())
            
        }, placeholder: {
            Image(.avatarPlaceholder)
                .resizable()
                .modifier(CellImageStyle())
        })
    }
}

//#Preview {
//    GFAvatarImage()
//}
