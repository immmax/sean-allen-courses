//
//  Step_TrackerApp.swift
//  Step Tracker
//
//  Created by Maxim Datskiy on 5/1/24.
//

import SwiftUI

@main
struct Step_TrackerApp: App {
    
    let hkManager = HealthKitManager()
    
    var body: some Scene {
        WindowGroup {
            DashboardView()
                .environment(hkManager)
        }
    }
}
