//
//  MainWeatherStatusView.swift
//  SwiftUI-Weather
//
//  Created by Maxim Datskiy on 9/29/23.
//

import SwiftUI

struct MainWeatherStatusView: View {
    
    var weatherType: WeatherType
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10)  {
            Image(systemName: weatherType.icon)
                .symbolRenderingMode(.multicolor)
//                .symbolRenderingMode(.palette)
                .resizable()
//                .foregroundStyle(.red, .lightBlue, .pink)
                .scaledToFit()
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(
                    .system(
                        size: 70,
                        weight: .medium
                    )
                )
                .foregroundColor(.white)
        }
    }
}
