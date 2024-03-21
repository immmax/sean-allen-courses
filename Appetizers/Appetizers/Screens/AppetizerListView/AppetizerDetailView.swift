//
//  DetailView.swift
//  Appetizers
//
//  Created by Maxim Datskiy on 3/20/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer: Appetizer
    
    var body: some View {
        VStack {
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
            Image(.asianFlankSteak)
                .resizable()
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
                    VStack(spacing: 5) {
                        Text("Calories")
                            .bold()
                            .font(.caption)
                        
                        Text("\(appetizer.calories)")
                            .fontWeight(.semibold)
                            .italic()
                            .foregroundStyle(.secondary)
                    }
                    
                    VStack(spacing: 5) {
                        Text("Carbs")
                            .bold()
                            .font(.caption)
                        
                        Text("\(appetizer.carbs)")
                            .fontWeight(.semibold)
                            .italic()
                            .foregroundStyle(.secondary)
                    }
                    
                    VStack(spacing: 5) {
                        Text("Protein")
                            .bold()
                            .font(.caption)
                        
                        Text("\(appetizer.protein)")
                            .fontWeight(.semibold)
                            .italic()
                            .foregroundStyle(.secondary)
                    }
                }
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add To Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding()
            }
            .buttonBorderShape(.roundedRectangle(radius: 10))
            .buttonStyle(.borderedProminent)
            .tint(.brandPrimary)
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(.rect(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(Button {
            print("dismiss")
        } label: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.white)
                    .opacity(0.6)
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundStyle(.black)
            }
        }, alignment: .topTrailing)
        
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer)
}
