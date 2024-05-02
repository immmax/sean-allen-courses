//
//  HealthKitManager.swift
//  Step Tracker
//
//  Created by Maxim Datskiy on 5/2/24.
//

import Foundation
import HealthKit
import Observation

@Observable class HealthKitManager {
    
    let store = HKHealthStore()
    
    let types: Set = [HKQuantityType(.stepCount), HKQuantityType(.bodyMass)]
}
