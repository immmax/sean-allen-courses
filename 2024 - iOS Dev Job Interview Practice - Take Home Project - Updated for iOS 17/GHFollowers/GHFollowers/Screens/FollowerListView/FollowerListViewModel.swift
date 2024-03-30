//
//  FollowerListViewModel.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/29/24.
//

import SwiftUI

@MainActor final class FollowersListViewModel: ObservableObject {
    
    @Published var followers: [Follower] = []
    @Published var alertItem: AlertItem?
    
    @Published var isLoading = false
    
    @Published var isShowingDetails = false
    @Published var selectedUser: User?
    
    
    func getFollowers(username: String) {
        isLoading = true
        
        Task {
            do {
                followers = try await NetworkManager.shared.getFollowers(for: username, page: 1)
                isLoading = false
            } catch {
                if let gfError = error as? GFError {
                    switch gfError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .emptyUsername:
                        alertItem = AlertContext.emptyUsername
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    case .invalidUsername:
                        alertItem = AlertContext.invalidUsername
                    case .genericError:
                        alertItem = AlertContext.genericError
                    }
                } else {
                    alertItem = AlertContext.genericError
                }
                isLoading = false
            }
        }
    }
}
