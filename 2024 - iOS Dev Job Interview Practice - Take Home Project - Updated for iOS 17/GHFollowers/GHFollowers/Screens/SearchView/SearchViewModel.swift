//
//  SearchViewModel.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/29/24.
//

import SwiftUI

final class SearchViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var isShowingFollowersListView = false
    
    @Published var alertItem: AlertItem?
    
    func showFollowersList() {
        guard !username.isEmpty else {
            print("No username")
            alertItem  = AlertContext.emptyUsername
            return
        }
        
        isShowingFollowersListView = true
    }
}
