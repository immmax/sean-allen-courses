//
//  GFError.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/30/24.
//

import Foundation

enum GFError: Error {
    case genericError
    case invalidURL
    case invalidData
    
    case emptyUsername
    case invalidUsername
    case unableToComplete
    case noFollowers
    case unableToFavorite
    case alreadyInFavorites
}
