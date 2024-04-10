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
    static let invalidURL = AlertItem(
        title: Text("Server Error"),
        message: Text("There was an issue connecting to the server. If this persists, please contact support"),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidData = AlertItem(
        title: Text("Server Error"),
        message: Text("The data received from the server was invalid. Please contact Support"),
        dismissButton: .default(Text("OK"))
    )
    
    static let unableToComplete = AlertItem(
        title: Text("Server Error"),
        message: Text("Unable to complete your request at this time. Please check your internet connection."),
        dismissButton: .default(Text("OK"))
    )
    
    static let noFollowers = AlertItem(
        title: Text("No Followers"),
        message: Text("This user has no followers. What a shame 😞."),
        dismissButton: .default(Text("OK"))
    )
    
    static let unableToFavorite = AlertItem(
        title: Text("Oops!"),
        message: Text("There was an error favoriting this user. Please try again"),
        dismissButton: .default(Text("OK"))
    )
    
    static let alreadyInFavorites = AlertItem(
        title: Text("Oh, wow!"),
        message: Text("You've already favorited this user. You must REALLY like them!"),
        dismissButton: .default(Text("OK"))
    )
    
    // MARK: - Generic Alerts
    static let genericError = AlertItem(
        title: Text("Error"),
        message: Text("We're unable to complete your request this time. Please check your internet connection or try again later."),
        dismissButton: .default(Text("Ok"))
    )
    
}
