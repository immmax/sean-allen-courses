//
//  Date+Ext.swift
//  Step Tracker
//
//  Created by Maxim Datskiy on 7/31/24.
//

import Foundation

extension Date {
    var weekdayInt: Int {
        Calendar.current.component(.weekday, from: self)
    }
    
    var weekdayTitle: String {
        self.formatted(.dateTime.weekday(.wide))
    }
    
    var accessibilityDate: String {
        self.formatted(.dateTime.month(.wide).day())
    }
}
