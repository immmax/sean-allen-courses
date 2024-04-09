//
//  SearchViewModel.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/29/24.
//

import SwiftUI
import Observation

@Observable  final class SearchViewModel {
    
    var username = ""
    var isShowingFollowersListView = false
    
    var alertItem: AlertItem?
    
    func showFollowersList() {
        guard !username.isEmpty else {
            alertItem  = AlertContext.emptyUsername
            return
        }
        
        isShowingFollowersListView = true
    }
}
