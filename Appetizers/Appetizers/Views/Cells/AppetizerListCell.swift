//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Maxim Datskiy on 3/18/24.
//

import SwiftUI

struct AppetizerListCell: View {
    var appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .scaledToFit()
                .frame(width: 120, height: 90)
                .cornerRadius(9)
            
            VStack(alignment: .leading, spacing: 5)  {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizerOne)
}
