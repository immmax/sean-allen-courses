//
//  HealthDataListView.swift
//  Step Tracker
//
//  Created by Maxim Datskiy on 5/1/24.
//

import SwiftUI

struct HealthDataListView: View {
    
    @State private var isShowingAddData = false
    var metric: HealthMetricContext
    
    @State private var addDataDate: Date = .now
    @State private var valueToAdd: String = ""
    
    var body: some View {
        List(0..<28) { i in
            HStack {
                Text(Date(), format: .dateTime.month(.wide).day().year())
                Spacer()
                Text(10_000, format: .number.precision(.fractionLength(metric == .steps ? 0 : 2)))
            }
        }
        .navigationTitle(metric.title)
        .sheet(isPresented: $isShowingAddData) {
            addDataView
        }
        .toolbar {
            Button("Add Data", systemImage: "plus") {
                isShowingAddData = true
            }
        }
    }
    
    var addDataView: some View {
        NavigationStack {
            Form {
                DatePicker("Date", selection: $addDataDate, displayedComponents: .date)
                HStack {
                    Text(metric.title)
                    Spacer()
                    TextField("Value", text: $valueToAdd)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 150)
                        .keyboardType(metric == .steps ? .numberPad : .decimalPad)
                }
            }
            .navigationTitle(metric.title)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Dismiss") { isShowingAddData = false }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Data") { /* do code later */ }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HealthDataListView(metric: .steps)
    }
}
