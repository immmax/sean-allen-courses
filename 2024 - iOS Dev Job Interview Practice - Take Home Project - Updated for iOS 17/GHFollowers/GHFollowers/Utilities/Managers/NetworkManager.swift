//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/30/24.
//

import SwiftUI

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
    
    let baseURL = "https://api.github.com/users/"
    
    func getFollowers(for username: String, page: Int) async throws -> [Follower] {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            throw GFError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let followers =  try decoder.decode([Follower].self, from: data)
            return followers
        } catch {
            throw GFError.invalidData
        }
    }
    
    
}
