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
                if error is GFError {
                    handleErrors(error as! GFError)
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
                if error is GFError {
                    handleErrors(error as! GFError)
                } else {
                    alertItem = AlertContext.genericError
                }
            }
        }
    }
    
    func addButtonTapped() {
        // more code to come
        print("Add button tapped")
    }

    func handleErrors(_ error: GFError) {
        switch error {
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
        case .noFollowers:
            alertItem = AlertContext.noFollowers
        case .genericError:
            alertItem = AlertContext.genericError
        case .unableToFavorite:
            alertItem = AlertContext.unableToFavorite
        case .alreadyInFavorites:
            alertItem = AlertContext.alreadyInFavorites
        }
    }
}
