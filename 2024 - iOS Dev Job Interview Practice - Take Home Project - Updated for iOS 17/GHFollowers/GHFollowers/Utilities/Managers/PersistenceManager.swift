//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/10/24.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType) throws {
        do {
            let favorites = try retrieveFavorites()
            var retrievedFavorites = favorites
            
            switch actionType {
            case .add:
                guard !retrievedFavorites.contains(favorite) else { throw GFError.alreadyInFavorites}
                
                retrievedFavorites.append(favorite)
            case .remove:
                retrievedFavorites.removeAll { $0.login == favorite.login }
            }
            
            try save(favorites: favorites)
        } catch {
            throw GFError.unableToComplete
        }
    }
    
    
    static func retrieveFavorites() throws -> [Follower] {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            return []
        }
        
        do {
            let favorites =  try JSONDecoder().decode([Follower].self, from: favoritesData)
            return favorites
        } catch {
            throw GFError.unableToFavorite
        }
        
    }
    
    
    static func save(favorites: [Follower]) throws {
        
        do {
            let encodedFavorites =  try JSONEncoder().encode(favorites)
            defaults.setValue(encodedFavorites, forKey: Keys.favorites)
        } catch {
            throw GFError.unableToFavorite
        }
    }
}
