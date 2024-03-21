//
//  OrderView.swift
//  Appetizers
//
//  Created by Maxim Datskiy on 3/17/24.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems: [Appetizer] = MockData.orderItems
    
    var body: some View {
        NavigationStack {
            ZStack {
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
                        APButton(title: "$\(9 * 9, specifier: "%.2f") - Place Order")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom, 25)
                    
                }
                
                if orderItems.isEmpty {
                    EmptyState(imageName: "empty-order",
                               message: "You have no items in your order.\nPlease add an appetizer!")
                }
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
