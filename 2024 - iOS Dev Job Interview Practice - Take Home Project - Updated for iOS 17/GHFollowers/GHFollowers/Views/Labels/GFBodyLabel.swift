//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/4/24.
//

import SwiftUI

struct GFBodyLabel: View {
    
    var text: String
    var textAlignment: TextAlignment
    var numberOfLines: Int
    
    var body: some View {
        Text(text)
            .font(.body)
            .minimumScaleFactor(0.75)
            .foregroundStyle(Color(.secondaryLabel))
            .multilineTextAlignment(textAlignment)
            .lineLimit(numberOfLines)
            .padding()
    }
    
    init(_ text: String, textAlignment: TextAlignment = .leading, numberOfLines: Int = 1) {
        self.text = text
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
}

#Preview {
    GFBodyLabel("Body Label", textAlignment: .center)
}
