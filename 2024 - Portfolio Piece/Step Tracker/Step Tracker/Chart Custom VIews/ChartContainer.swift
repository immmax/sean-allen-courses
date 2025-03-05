//
//  ChartContainer.swift
//  Step Tracker
//
//  Created by Maxim Datskiy on 8/22/24.
//

import SwiftUI

enum ChartType {
    case stepBar(average: Int)
    case stepWeekdayPie
    case weightLine(average: Double)
    case weightDiffBar
    
    var title: String {
        switch self {
        case .stepBar:
            "Staps"
        case .stepWeekdayPie:
            "Averages"
        case .weightLine:
            "Weight"
        case .weightDiffBar:
            "Average Weight Change"
        }
    }
    
    var symbol: String {
        switch self {
        case .stepBar:
            "figure.walk"
        case .stepWeekdayPie:
            "calendar"
        case .weightLine, .weightDiffBar:
            "figure"
        }
    }
    
    var subtitle: String {
        switch self {
        case .stepBar(let average):
            "Avg. \(average.formatted()) steps"
        case .stepWeekdayPie:
            "Last 28 Days"
        case .weightLine(let average):
            "Avg. \(average.formatted(.number.precision(.fractionLength(1)))) lbs"
        case .weightDiffBar:
            "Per Weekday (Last 28 Days)"
        }
    }
    
    var isNav: Bool {
        switch self {
        case .stepBar, .weightLine:
            return true
        case .stepWeekdayPie, .weightDiffBar:
            return false
        }
    }
    
    var context: HealthMetricContext {
        switch self {
        case .stepBar, .stepWeekdayPie:
            .steps
        case .weightLine, .weightDiffBar:
            .weight
        }
    }
}


//struct ChartContainerConfiguration {
//    let title: String
//    let symbol: String
//    let subtitle: String
//    let context: HealthMetricContext
//    let isNav: Bool
//}


struct ChartContainer<Content: View>: View {
    
    let chartType: ChartType
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading ) {
            if chartType.isNav {
                navigationLinkView
            } else {
                titleView
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 12)
            }
            
            content()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
    }
    
    var navigationLinkView: some View {
        NavigationLink(value: chartType.context) {
            HStack {
                titleView
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
        .foregroundStyle(.secondary)
        .padding(.bottom, 12)
    }
    
    var titleView: some View {
        VStack(alignment: .leading) {
            Label(chartType.title, systemImage: chartType.symbol)
                .font(.title3.bold())
                .foregroundStyle(chartType.context == .steps ? .pink : .indigo)
                .accessibilityLabel("Step Bar Chart - Last 28 Days")
            
            Text(chartType.subtitle)
                .font(.caption)
        }
    }
}

#Preview {
    ChartContainer(chartType: .stepWeekdayPie) {
        Text("Chart Goes Here")
            .frame(minHeight: 150)
    }
}
