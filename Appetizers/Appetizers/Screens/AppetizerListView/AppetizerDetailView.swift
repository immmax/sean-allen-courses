//
//  DetailView.swift
//  Appetizers
//
//  Created by Maxim Datskiy on 3/20/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .scaledToFit()
                .frame(height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: "\(appetizer.calories)")
                    
                    NutritionInfo(title: "Carbs", value: "\(appetizer.carbs) g")
                    
                    NutritionInfo(title: "Protein", value: "\(appetizer.protein) g")
                }
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShowingDetail = false
            } label: {
//                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add To Order")
                Text("$\(appetizer.price, specifier: "%.2f") - Add To Order")
            }
//            .buttonStyle(.bordered)
//            .tint(.brandPrimary)
//            .controlSize(.large)
            .modifier(StandardButtonStyle())
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(.rect(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
        
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizerOne, isShowingDetail: .constant(true))
}

struct NutritionInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text(value)
                .fontWeight(.semibold)
                .italic()
                .foregroundStyle(.secondary)
        }
    }
}
