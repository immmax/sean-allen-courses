//
//  FollowerListViewModel.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/29/24.
//

import SwiftUI
import Observation

@Observable final class FollowersListViewModel {
    
    var alertItem: AlertItem?
    
    var isLoading = false
    var followers: [Follower] = []
    var page = 1
    
    var searchText = ""
    
    var isShowingUserInfo = false
    var user: User?
    
    // Published were above
    
    var filteredFollowers: [Follower] {
//        #warning("It searches only on the loaded pages! Not in all followers!")
        if searchText.isEmpty {
            return followers
        } else {
            return followers.filter { $0.login.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    func getFollowers(username: String, page: Int) {
        isLoading = true
        
        Task {
            do {
                let newPageOfFollowers = try await NetworkManager.shared.getFollowers(for: username, page: page)
                followers.append(contentsOf: newPageOfFollowers)
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
    
    func getUserInfo(username: String) {
        isLoading = true
        
        Task {
            do {
                user = try await NetworkManager.shared.getUserInfo(for: username)
                isLoading = false
                isShowingUserInfo = true
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
            }
        }
    }

}
