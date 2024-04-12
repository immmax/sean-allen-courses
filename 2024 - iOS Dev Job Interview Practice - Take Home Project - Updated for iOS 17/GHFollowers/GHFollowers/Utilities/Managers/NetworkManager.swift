//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/30/24.
//

import SwiftUI

final class NetworkManager {
    
    static let shared            = NetworkManager()
    private let cache            = NSCache<NSString, UIImage>()
    let baseURL                  = "https://api.github.com/users/"
    let decoder                  = JSONDecoder()
    
    private init() { 
        decoder.keyDecodingStrategy  = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func getFollowers(for username: String, page: Int) async throws -> [Follower] {
        let endpoint  = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else { throw GFError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GFError.unableToComplete
        }
        
        do {
            return try decoder.decode([Follower].self, from: data)
        } catch {
            throw GFError.invalidData
        }
    }
    
    
    func downloadImage(fromURLString urlString: String) async -> Image? {
        
        let cacheKey  = NSString(string: urlString)
        if let image  = cache.object(forKey: cacheKey) { return Image(uiImage: image) }
        guard let url = URL(string: urlString) else { return nil}
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return nil}
            cache.setObject(image, forKey: cacheKey)
            return Image(uiImage: image)
        } catch {
            return nil
        }
    }    
    
    func getUserInfo(for username: String) async throws -> User {
        let endpoint  = baseURL + "\(username)"
        
        guard let url = URL(string: endpoint) else { throw GFError.invalidURL }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            return try decoder.decode(User.self, from: data)
        } catch {
            throw GFError.invalidData
        }
    }
}
