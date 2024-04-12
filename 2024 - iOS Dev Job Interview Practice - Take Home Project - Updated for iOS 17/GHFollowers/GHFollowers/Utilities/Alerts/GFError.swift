//
//  GFError.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/30/24.
//

import Foundation

enum GFError: Error {
    
    case genericError
    case unableToComplete
    
    case invalidURL
    case invalidData
    
    case invalidUsername
    case emptyUsername
    case noFollowers
    
    case unableToFavorite
    case alreadyInFavorites
}
