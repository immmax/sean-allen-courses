//
//  GFItemInfoView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/9/24.
//

import SwiftUI


enum ItemInfoType {
    case repos, gists, followers, following
}


struct GFItemInfoView: View {
    let itemInfoType: ItemInfoType
    
    let symbolImage: String
    let title: String   // textAlignment: .left, fontSize: 14
    let count: Int      // textAlignment: .center, fontSize: 14
    
    var body: some View {
        VStack {
            Label(title, systemImage: symbolImage)
                .tint(Color(.label))
                .font(.headline)
            
            Text("\(count)")
                .font(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    init(itemInfoType: ItemInfoType, withCount count: Int) {
        self.itemInfoType = itemInfoType
        switch itemInfoType {
        case .repos:
            self.symbolImage    = SFSymbols.repos
            self.title          = "Public Repos"
        case .gists:
            self.symbolImage    = SFSymbols.gists
            self.title          = "Public Gists"
        case .followers:
            self.symbolImage    = SFSymbols.followers
            self.title          = "Followers"
        case .following:
            self.symbolImage    = SFSymbols.following
            self.title          = "Followings"
        }
        self.count             = count
    }
}

#Preview {
    GFItemInfoView(itemInfoType: .followers, withCount: 14)
}
