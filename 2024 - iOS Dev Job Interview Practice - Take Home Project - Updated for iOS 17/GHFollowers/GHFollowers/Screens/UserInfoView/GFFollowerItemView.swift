//
//  GFFollowerItemView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/10/24.
//

import SwiftUI

protocol GFFollowerViewDelegate {
    func didTapGetFollowers(for user: User)
}

struct GFFollowerItemView: View {
    
    let user:       User
    var delegate:   GFFollowerViewDelegate
    
    var body: some View {
        GFInfoCardView(user:            user,
                       itemInfoOneType: .followers,
                       countOne:        user.followers,
                       itemInfoTwoType: .following,
                       countTwo:        user.following,
                       buttonTitle:     "Get Followers",
                       systemImageName: SFSymbols.getFollowersButton,
                       color:           .green,
                       action:          { delegate.didTapGetFollowers(for: user) }
        )
    }
}
