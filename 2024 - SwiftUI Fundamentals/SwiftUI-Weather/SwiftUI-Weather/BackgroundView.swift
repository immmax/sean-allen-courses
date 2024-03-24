//
//  BackgroundView.swift
//  SwiftUI-Weather
//
//  Created by Maxim Datskiy on 9/29/23.
//

import SwiftUI

struct BackgroundView: View {
    
    var isDay: Bool
    
    var topColor: Color {
        isDay ? .blue : .black
    }
    var bottomColor: Color {
        isDay ? .lightBlue : .gray
    }
    
    var body: some View {
//        LinearGradient(
//            gradient: Gradient(colors: [topColor, bottomColor]),
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing
//        )
//            .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isDay ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

