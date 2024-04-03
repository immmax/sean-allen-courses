//
//  UserInfoViewModel.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/3/24.
//

import Foundation
import Observation

@Observable final class UserInfoViewModel {
    
    var user: User?
    var alertItem: AlertItem?
    
    var isLoading = false
    
    init(user: User? = MockData.sampleUser, alertItem: AlertItem? = nil, isLoading: Bool = false) {
        self.user = user
        self.alertItem = alertItem
        self.isLoading = isLoading
    }    
    
    func getUserInfo(username: String) {
        isLoading = true
        
        Task {
            do {
                user = try await NetworkManager.shared.getUserInfo(for: username)
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
            }
        }
    }
    
}
