//
//  ChartEmptyView.swift
//  Step Tracker
//
//  Created by Maxim Datskiy on 8/21/24.
//

import SwiftUI

struct ChartEmptyView: View {
    let systemImageName: String
    let title: String
    let description: String
    
    var body: some View {
        ContentUnavailableView {
            Image(systemName: systemImageName)
                .resizable()
                .frame(width: 32, height: 32)
                .padding(.bottom, 8)
            
            Text(title)
                .font(.callout.bold())
            
            Text(description)
                .font(.footnote)
        }
        .foregroundStyle(.secondary)
        .offset(y: -12)
    }
}

#Preview {
    ChartEmptyView(systemImageName: "chart.bar", title: "No Data", description: "No step count data from the health app")
}
