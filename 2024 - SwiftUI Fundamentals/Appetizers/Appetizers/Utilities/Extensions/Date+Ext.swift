//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Maxim Datskiy on 3/23/24.
//

import Foundation

extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: self)!
    }
    
    var oneHundredTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: self)!
    }
}
