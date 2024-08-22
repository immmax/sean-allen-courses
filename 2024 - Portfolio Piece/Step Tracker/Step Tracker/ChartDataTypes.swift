//
//  ChartDataTypes.swift
//  Step Tracker
//
//  Created by Maxim Datskiy on 7/31/24.
//

import Foundation

struct WeekdayChartData: Identifiable, Equatable {
    let id = UUID()
    let date: Date
    let value: Double
}
