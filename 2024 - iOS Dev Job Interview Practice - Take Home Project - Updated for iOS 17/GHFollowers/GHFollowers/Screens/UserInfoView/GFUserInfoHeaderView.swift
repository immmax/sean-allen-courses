//
//  GFUserInfoHeaderView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/4/24.
//

import SwiftUI

struct GFUserInfoHeaderView: View {
    
    let user: User!
    
    var body: some View {
        VStack {
            HStack {
                GFRemoteImage(urlString: user.avatarUrl)
                    .modifier(UserInfoImageStyle())
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(user.login)
                        .font(.largeTitle)
                        .bold()
                        .lineLimit(1)
                    
                    Text(user.name ?? "")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                    
                    Label(user.location ?? "No Location", systemImage: SFSymbols.location)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.bottom, 10)
//            #warning("Need to delete \r and \n symbols from the string")
            Text(user.bio?.trimmingCharacters(in: ["\n", "\r", "\t", " "]) ?? "No bio available")
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(3, reservesSpace: false)
        }
        .padding(.horizontal, 20)
    }
    
    init(user: User) {
        self.user = user
    }
}

#Preview {
    GFUserInfoHeaderView(user: MockData.sampleUser)
}
