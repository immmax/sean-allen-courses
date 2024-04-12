//
//  MockData.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/3/24.
//

import Foundation

struct MockData {
    
    static let sampleFollower   = Follower(id:        123,
                                           login:     "just-a-login",
                                           avatarUrl: "")
    
    static let sampleUser       = User(id:            123,
                                       login:         "just-a-login",
                                       avatarUrl:     "",
                                       name:          "Jim Halpert",
                                       location:      "NY, USA",
                                       publicRepos:   14,
                                       publicGists:   11,
                                       followers:     25,
                                       following:     16,
                                       htmlUrl:       "",
                                       createdAt:     .now)
    
    static let emptyUser        = User(id:             0,
                                       login:         "EmptyUser",
                                       avatarUrl:     "",
                                       name:          "Empty User",
                                       location:      "No Location",
                                       publicRepos:   0,
                                       publicGists:   0,
                                       followers:     0,
                                       following:     0,
                                       htmlUrl:       "",
                                       createdAt:     .distantPast)
}
