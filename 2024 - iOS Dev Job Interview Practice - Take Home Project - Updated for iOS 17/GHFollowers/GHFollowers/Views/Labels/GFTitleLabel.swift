//
//  GFTitleLabel.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/8/24.
//

import SwiftUI

struct GFTitleLabel: View {
    
    var text: String
    var textAlignment: TextAlignment
    var fontSize: CGFloat

    
    var body: some View {
//            .minimumScaleFactor(0.9)
        Text(text)
            .multilineTextAlignment(textAlignment)
            .font(.system(size: fontSize))
            .fontWeight(.bold)
            .foregroundStyle(Color(.label))
            .lineLimit(1)
            .minimumScaleFactor(0.90)
    }
    
    init(_ text: String, textAlignment: TextAlignment, fontSize: CGFloat) {
        self.text = text
        self.textAlignment = textAlignment
        self.fontSize = fontSize
    }
}

#Preview {
    GFTitleLabel("Title Label", textAlignment: .center, fontSize: 12)
}
