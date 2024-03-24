//
//  Day.swift
//  SwiftUI-Weather
//
//  Created by Maxim Datskiy on 3/16/24.
//

import Foundation

enum WeekDay {
    case sunday, monday, tuesday, wednesday, thursday, friday, saturday
    
    var shortName: String {
        switch self {
        case .sunday: return "SUN"
        case .monday: return "MON"
        case .tuesday: return "TUE"
        case .wednesday: return "WED"
        case .thursday: return "THU"
        case .friday: return "FRI"
        case .saturday: return "SAT"
        }
    }
}

enum WeatherType {
    case sun, moon, sunAndCloud, cloud, rain, wind, snow
    
    var icon: String {
        switch self {
        case .sun: return "sun.max.fill"
        case .sunAndCloud: return "cloud.sun.fill"
        case .cloud: return "cloud.fill"
        case .rain: return "cloud.rain.fill"
        case .wind: return "wind"
        case .snow: return "snowflake"
        case .moon: return "moon.stars.fill"
        }
    }
}

struct Day {
    let name: WeekDay
    let weather: WeatherType
    
    init(_ name: WeekDay, weather: WeatherType) {
        self.name = name
        self.weather = weather
    }
}
