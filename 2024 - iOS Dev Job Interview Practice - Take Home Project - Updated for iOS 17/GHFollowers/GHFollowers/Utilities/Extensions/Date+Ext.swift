//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/9/24.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        return formatted(.dateTime.month(.wide).year())
    }
}
