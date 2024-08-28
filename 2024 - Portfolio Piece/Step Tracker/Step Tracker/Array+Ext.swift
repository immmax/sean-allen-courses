//
//  Array+Ext.swift
//  Step Tracker
//
//  Created by Maxim Datskiy on 8/27/24.
//

import Foundation

extension Array where Element == Double {
    var average: Double {
        guard !self.isEmpty else { return 0 }
        let total = self.reduce(0, +)
        return total / Double(self.count)
    }
}
