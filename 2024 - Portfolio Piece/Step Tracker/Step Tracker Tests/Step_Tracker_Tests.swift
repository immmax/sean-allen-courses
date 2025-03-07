//
//  Step_Tracker_Tests.swift
//  Step Tracker Tests
//
//  Created by Maxim Datskiy on 3/6/25.
//

import Foundation
import Testing
@testable import Step_Tracker

struct Step_Tracker_Tests {

    @Test func arrayAverage() {
        let array: [Double] = [2.0, 3.1, 0.45, 1.84]
        #expect(array.average == 1.8475)
    }
}

@Suite("Chart Helper Tests")
struct ChartHelperTests {
    
    var metrics: [HealthMetric] = [
        .init(date: Calendar.current.date(from: .init(year: 2024, month: 10, day: 14))!, value: 1000),  // Monday
        .init(date: Calendar.current.date(from: .init(year: 2024, month: 10, day: 15))!, value: 500),   // Tuesday
        .init(date: Calendar.current.date(from: .init(year: 2024, month: 10, day: 16))!, value: 250),   // Wednesday
        .init(date: Calendar.current.date(from: .init(year: 2024, month: 10, day: 21))!, value: 750)    // Monday
    ]
    
    @Test func averageWeekdayCount() {
        let averageWeekdayCount = ChartHelper.averageWeekdayCount(for: metrics)
        #expect(averageWeekdayCount.count == 3)
        #expect(averageWeekdayCount[0].value == 875)
        #expect(averageWeekdayCount[1].value == 500)
        #expect(averageWeekdayCount[2].date.weekdayTitle == "Wednesday")
    }
}
