//
//  ChartDataTypes.swift
//  Step Tracker
//
//  Created by Maxim Datskiy on 7/31/24.
//

import Foundation

struct DateValueChartData: Identifiable, Equatable {
    let id = UUID()
    let date: Date
    let value: Double
}
