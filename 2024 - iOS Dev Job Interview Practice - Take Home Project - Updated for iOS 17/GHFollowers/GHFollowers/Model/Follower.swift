//
//  Follower.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/29/24.
//

import SwiftUI

struct Follower: Codable, Identifiable {
    let id: Int
    let login: String
    let avatarUrl: String
}
