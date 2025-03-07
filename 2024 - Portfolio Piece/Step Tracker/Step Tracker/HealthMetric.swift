//
//  HealthMetric.swift
//  Step Tracker
//
//  Created by Maxim Datskiy on 5/14/24.
//

import Foundation

struct HealthMetric: Identifiable {
    let id = UUID()
    let date: Date
    let value: Double
}
