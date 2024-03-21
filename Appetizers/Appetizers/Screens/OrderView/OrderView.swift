//
//  OrderView.swift
//  Appetizers
//
//  Created by Maxim Datskiy on 3/17/24.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems: [Appetizer] = Array(repeating: MockData.sampleAppetizer, count: 3)
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(orderItems) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(.plain)
                
                Spacer()
                
                Button {
                    print("Order placed")
                } label: {
                    APButton(title: "$\(orderItems[0].price, specifier: "%.2f") - Place Order")
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom, 25)
                
            }
                .navigationTitle("🧾 Orders")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
}
