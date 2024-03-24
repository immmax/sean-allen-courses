//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Maxim Datskiy on 9/29/23.
//

// TODO: Build Model and refactor HStack with an array
// TODO: Connect to free API
// TODO: Make TabView with 4-5 cities
import SwiftUI

struct City {
    let  id = UUID()
    let name: String
    let weather: [Day]
}

struct ContentView: View {
     
    @State private var isDay: Bool = false
    var cities: [City] = [
        City(name: "Cupertino, CA", weather: []),
        City(name: "Ferndale, WA", weather: []),
        City(name: "Bellingham, WA", weather: []),
        City(name: "Kyiv, UA", weather: []),
        City(name: "Moscow, RU", weather: [])]
    
    var body: some View {
        ZStack {
            BackgroundView(isDay: isDay)
                
            TabView {
                ForEach(cities, id: \.id) { city in
                    CityView(isDay: $isDay, city: city)
                        .tabItem {
                            Label("\(city.name)", systemImage: "city")
                            }
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
