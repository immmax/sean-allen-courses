//
//  UserInfoViewModel.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/3/24.
//

import Foundation
import Observation

@Observable final class UserInfoViewModel {
    var isLoading = false
    var alertItem: AlertItem?
    
    init(alertItem: AlertItem? = nil) {
        self.alertItem = alertItem
    }
}
