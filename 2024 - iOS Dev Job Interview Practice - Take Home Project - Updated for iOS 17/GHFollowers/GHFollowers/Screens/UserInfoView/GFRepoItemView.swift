//
//  GFRepoItemView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/10/24.
//

import SwiftUI

protocol GFRepoItemViewDelegate {
    func didTapGitHubProfile(for user: User)
}

struct GFRepoItemView: View {
    
    let user:       User
    var delegate:   GFRepoItemViewDelegate
    
    var body: some View {
        GFInfoCardView(user:            user,
                       itemInfoOneType: .repos,
                       countOne:        user.publicRepos,
                       itemInfoTwoType: .gists,
                       countTwo:        user.publicGists,
                       buttonTitle:     "GitHub Profile",
                       systemImageName: SFSymbols.GitHubProfileButton,
                       color:           .purple,
                       action:          { delegate.didTapGitHubProfile(for: user) }
        )
    }
}
