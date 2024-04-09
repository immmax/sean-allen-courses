//
//  GFSecondaryTitleLabel.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/4/24.
//

import SwiftUI

struct GFSecondaryTitleLabel: View {
    
    var text: String
    var fontSize: CGFloat
    var systemImage: String
    
    var body: some View {
        Label(text, systemImage: systemImage)
            .multilineTextAlignment(.leading)
            .font(.system(size: fontSize))
            .fontWeight(.medium)
            .foregroundStyle(Color(.secondaryLabel))
            .minimumScaleFactor(0.9)
            .lineLimit(1)
    }
    
    init(_ text: String, fontSize: CGFloat, systemImage: String = "") {
        self.text = text
        self.fontSize = fontSize
        self.systemImage = systemImage
    }
}

#Preview {
    GFSecondaryTitleLabel("Secondary Label", fontSize: 20)
}
