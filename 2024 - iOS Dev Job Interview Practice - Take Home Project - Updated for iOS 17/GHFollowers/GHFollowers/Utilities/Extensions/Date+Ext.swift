//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/9/24.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter        = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
    
}
