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
    var followers: [Follower]   = []
    var user:      User?
    var page                    = 1
    var searchText              = ""
    var isLoading               = false
    var isShowingUserInfo       = false
    let columns                 = Array(repeating: GridItem(.flexible()), count: 3)
    
    var filteredFollowers: [Follower] {
    #warning("It searches only in the loaded pages! Not in all followers!")
        if searchText.isEmpty {
            return followers
        } else {
            return followers.filter { $0.login.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    
    func getFollowers(username: String, page: Int) {
        isLoading                       = true
        
        Task {
            do {
                let newPageOfFollowers  = try await NetworkManager.shared.getFollowers(for: username, page: page)
                isLoading               = false
                followers.append(contentsOf: newPageOfFollowers)
            } catch {
                if error is GFError {
                    handleErrors(error as! GFError)
                } else {
                    alertItem           = AlertContext.genericError
                }
                isLoading               = false
            }
        }
    }
    
    func getUserInfo(username: String) {
        isLoading                   = true
        
        Task {
            do {
                user                = try await NetworkManager.shared.getUserInfo(for: username)
                isLoading           = false
                isShowingUserInfo   = true
            } catch {
                if error is GFError {
                    handleErrors(error as! GFError)
                } else {
                    alertItem       = AlertContext.genericError
                }
            }
        }
    }
    
    
    func addToFavorites(for username: String) {
        isLoading               = true
        
        Task {
            do {
                let currentUser = try await NetworkManager.shared.getUserInfo(for: username)
                isLoading       = false
                let follower    = Follower(id: currentUser.id, login: currentUser.login, avatarUrl: currentUser.avatarUrl)
                try PersistenceManager.updateWith(favorite: follower, actionType: .add)
                alertItem       = AlertContext.successfullyFavorited
            } catch {
                if error is GFError {
                    handleErrors(error as! GFError)
                } else {
                    alertItem   = AlertContext.genericError
                }
                isLoading       = false
            }
        }
    }
    
    
    func getNextPage(for follower: Follower) {
        if follower == followers.last {
            page    += 1
            getFollowers(username: follower.login, page: page)
        }
    }
    

    func handleErrors(_ error: GFError) {
        switch error {
        case .invalidURL:           alertItem = AlertContext.invalidURL
        case .invalidData:          alertItem = AlertContext.invalidData
        case .emptyUsername:        alertItem = AlertContext.emptyUsername
        case .unableToComplete:     alertItem = AlertContext.unableToComplete
        case .invalidUsername:      alertItem = AlertContext.invalidUsername
        case .noFollowers:          alertItem = AlertContext.noFollowers
        case .genericError:         alertItem = AlertContext.genericError
        case .unableToFavorite:     alertItem = AlertContext.unableToFavorite
        case .alreadyInFavorites:   alertItem = AlertContext.alreadyInFavorites
        }
    }
}
