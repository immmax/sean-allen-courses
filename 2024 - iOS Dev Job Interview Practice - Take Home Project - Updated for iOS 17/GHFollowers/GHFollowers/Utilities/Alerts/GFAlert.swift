//
//  GFAlert.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/29/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    // MARK: - Username Alerts
    static let emptyUsername = AlertItem(
        title: Text("Empty username"),
        message: Text("Please enter the username. We need to know who to look for 😄."),
        dismissButton: .default(Text("Ok"))
    )
    
    static let invalidUsername = AlertItem(
        title: Text("Invalid username"),
        message: Text("Please ensure your username is correct."),
        dismissButton: .default(Text("Ok"))
    )
    
    
    // MARK: - Network Alerts
    
    
    // MARK: - Generic Alerts
    static let genericError = AlertItem(
        title: Text("Error"),
        message: Text("We're unable to complete your request this time. Please check your internet connection or try again later."),
        dismissButton: .default(Text("Ok"))
    )
    
}
