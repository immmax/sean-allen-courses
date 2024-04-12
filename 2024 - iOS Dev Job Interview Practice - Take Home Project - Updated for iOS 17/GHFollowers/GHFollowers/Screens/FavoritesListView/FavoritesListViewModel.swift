//
//  FavoritesListViewModel.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/29/24.
//

import SwiftUI
import Observation

@Observable class FavoritesListViewModel {
    
    var favorites: [Follower]       = []
    
    func getFavorites() { favorites = try! PersistenceManager.retrieveFavorites() }
}
