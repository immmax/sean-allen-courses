//
//  StepBarChart.swift
//  Step Tracker
//
//  Created by Maxim Datskiy on 5/22/24.
//

import SwiftUI
import Charts

struct StepBarChart: View {
    
    @State private var rawSelectedDate: Date?
    @State private var selectedDay: Date?
    
    var chartData: [DateValueChartData]
    
    var selectedData: DateValueChartData? {
        ChartHelper.parseSelectedData(from: chartData, in: rawSelectedDate)
    }
    
    var body: some View {
        let config = ChartContainerConfiguration(title: "Steps",
                                                 symbol: "figure.walk",
                                                 subtitle: "Avg. \(Int(ChartHelper.averageValue(for: chartData))) steps",
                                                 context: .steps,
                                                 isNav: true)
        
        ChartContainer(config: config) {
            if chartData.isEmpty {
                ChartEmptyView(systemImageName: "chart.bar", title: "No Data", description: "No step count data from the Health App")
            } else {
                Chart  {
                    if let selectedData {
                        ChartAnnotationView(data: selectedData, context: .steps)
                    }
                    
                    RuleMark(y: .value("Average", ChartHelper.averageValue(for: chartData )))
                        .foregroundStyle(Color.secondary)
                        .lineStyle(.init(lineWidth: 1, dash: [5]))
                    
                    ForEach(chartData) { steps in
                        BarMark(
                            x: .value("Date", steps.date, unit: .day),
                            y: .value("Steps", steps.value)
                        )
                        .foregroundStyle(.pink.gradient)
                        .opacity(rawSelectedDate == nil || steps.date == selectedData?.date ? 1.0 : 0.3)
                    }
                }
                .frame(height: 150)
                .chartXSelection(value: $rawSelectedDate.animation(.easeInOut))
                .chartXAxis {
                    AxisMarks(preset: .aligned) {
                        AxisValueLabel(format: .dateTime.month(.defaultDigits).day())
                    }
                    
                }
                .chartYAxis {
                    AxisMarks(preset: .aligned) { value in
                        AxisGridLine()
                            .foregroundStyle(Color.secondary.opacity(0.3))
                        
                        AxisValueLabel((value.as(Double.self) ?? 0).formatted(.number.notation(.compactName)))
                    }
                }
            }
        }
        .sensoryFeedback(.selection, trigger: selectedDay)
        .onChange(of: rawSelectedDate) { oldValue, newValue in
            if oldValue?.weekdayInt != newValue?.weekdayInt {
                selectedDay = newValue
            }
        }
    }
}

#Preview {
    StepBarChart(chartData: ChartHelper.convert(data: []))
}
