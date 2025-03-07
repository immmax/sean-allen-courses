//
//  ChartHelper.swift
//  Step Tracker
//
//  Created by Maxim Datskiy on 8/23/24.
//

import Algorithms
import Foundation

struct ChartHelper {
    /// Convert array of ``HealthMetric`` data to array of ``DateValueChartData``
    /// - Parameter data: Array of ``HealthMetric``
    /// - Returns: Array of ``DateValueChartData``
    static func convert(data: [HealthMetric]) -> [DateValueChartData] {
        data.map { .init(date: $0.date, value: $0.value)}
    }
    
    /// Parse HealthKit data for selected date
    /// - Parameters:
    ///   - data: Array of ``DateValueChartData``
    ///   - selectedDate: Optional Date
    /// - Returns: Optional ``DateValueChartData``
    static func parseSelectedData(from data: [DateValueChartData], in selectedDate: Date?) -> DateValueChartData? {
        guard let selectedDate else { return nil }
        return data.first {
            Calendar.current.isDate(selectedDate, inSameDayAs: $0.date)
        }
    }
    
    /// Calculate weekday average of step count
    /// - Parameter metric: Array of ``HealthMetric``
    /// - Returns: Array of ``DateValueChartData``
    static func averageWeekdayCount(for metric: [HealthMetric]) -> [DateValueChartData] {
        let sortedByWeekday = metric.sorted(using: KeyPathComparator(\.date.weekdayInt))
        let weekdayArray = sortedByWeekday.chunked { $0.date.weekdayInt == $1.date.weekdayInt }
        var weekdayChartData: [DateValueChartData] = []
        
        for array in weekdayArray {
            guard let firstValue = array.first else { continue }
            let total = array.reduce(0) { $0 + $1.value }
            let avgSteps = total / Double(array.count)
            
            weekdayChartData.append(.init(date:  firstValue.date, value: avgSteps))
        }
        
        return weekdayChartData
    }
    
    /// Calculate weekday difference of  weight
    /// - Parameter weights: Array of ``HealthMetric``
    /// - Returns: Array of ``DateValueChartData``
    static func averageDailyWeightDiffs(for weights: [HealthMetric]) -> [DateValueChartData] {
        var diffValues: [(date: Date, value: Double)] = []
        
        guard weights.count > 1 else { return [] }
        
        for i in 1..<weights.count {
            let date = weights[i].date
            let diff = weights[i].value - weights[i-1].value
            diffValues.append((date: date, value: diff))
        }
        
        let sortedByWeekday = diffValues.sorted(using: KeyPathComparator(\.date.weekdayInt))
        let weekdayArray = sortedByWeekday.chunked { $0.date.weekdayInt == $1.date.weekdayInt }
        
        var weekdayChartData: [DateValueChartData] = []
        
        for array in weekdayArray {
            guard let firstValue = array.first else { continue }
            let total = array.reduce(0) { $0 + $1.value }
            let avgWeightDiff = total / Double(array.count)
            
            weekdayChartData.append(.init(date:  firstValue.date, value: avgWeightDiff))
        }
        
        return weekdayChartData
    }
}
