//
//  Appetizer.swift
//  Appetizers
//
//  Created by Maxim Datskiy on 3/17/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(
        id: 0001,
        name: "Test Appetizer",
        description: "This is the description for my appetizer. It's yummy.",
        price: 2.535,
        imageURL: "",
        calories: 14,
        protein: 11,
        carbs: 25
    )
    
    static let appetizers = Array(repeating: sampleAppetizer, count: 5)
}
