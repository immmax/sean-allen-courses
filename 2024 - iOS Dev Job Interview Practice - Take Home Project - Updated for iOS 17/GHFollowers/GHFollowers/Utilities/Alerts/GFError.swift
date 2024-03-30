//
//  GFError.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/30/24.
//

import Foundation

enum GFError: Error {
    case invalidURL
    case invalidData
    
    case emptyUsername
    case invalidUsername
    case unableToComplete
    case genericError
}
