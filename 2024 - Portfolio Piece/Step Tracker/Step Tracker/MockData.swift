//
//  MockData.swift
//  Step Tracker
//
//  Created by Maxim Datskiy on 8/9/24.
//

import Foundation

struct MockData {
    
    static var steps: [DateValueChartData] {
        var array: [DateValueChartData] = []
        
        for i in 0..<28 {
            let metric = DateValueChartData(date: Calendar.current.date(byAdding: .day, value: -i, to: .now)!,
                                      value: .random(in: 4_000...15_000))
            array.append(metric)
        }
        
        return array
    }
    
    static var weights: [DateValueChartData] {
        var array: [DateValueChartData] = []
        
        for i in 0..<28 {
            let metric = DateValueChartData(date: Calendar.current.date(byAdding: .day, value: -i, to: .now)!,
                                      value: .random(in: (160 + Double(i/3)...165 + Double(i/3))))
            array.append(metric)
        }
        
        return array
    }
}
