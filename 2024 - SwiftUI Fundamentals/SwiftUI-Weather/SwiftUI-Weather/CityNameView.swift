//
//  CityNameView.swift
//  SwiftUI-Weather
//
//  Created by Maxim Datskiy on 9/29/23.
//

import SwiftUI

struct CityNameView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(
                .system(
                    size: 34,
                    weight: .medium,
                    design: .default
                )
            )
            .foregroundColor(.white)
            .padding()
    }
}
