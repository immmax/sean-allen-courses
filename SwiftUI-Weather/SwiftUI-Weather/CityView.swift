//
//  CityView.swift
//  SwiftUI-Weather
//
//  Created by Maxim Datskiy on 3/16/24.
//

import SwiftUI

struct CityView: View {
    @Binding var isDay: Bool
    var city: City
    
    var body: some View {
        VStack {
            CityNameView(cityName: city.name)
                
                MainWeatherStatusView(
                    weatherType: isDay ? .sunAndCloud : .moon,
                    temperature: 76
                )
                
                Spacer()
                
                HStack(spacing: 25) {
                    DayView(
                        day: Day(.monday, weather: .rain),
                        temperature: 64
                    )
                    DayView(
                        day: Day(.tuesday, weather: .sun),
                        temperature: 88
                    )
                    DayView(
                        day: Day(.wednesday, weather: .wind),
                        temperature: 55
                    )
                    DayView(
                        day: Day(.thursday, weather: .snow),
                        temperature: 25
                    )
                    DayView(
                        day: Day(.friday, weather: .cloud),
                        temperature: 33
                    )
                }
                
                Spacer()
                    
                WeatherButton(
                    title: "Change Day Time",
                    textColor: .white,
                    backgroundColor: .mint,
                    isDay: $isDay
                )
            }
        }
}

//#Preview {
//    CityView()
//}
