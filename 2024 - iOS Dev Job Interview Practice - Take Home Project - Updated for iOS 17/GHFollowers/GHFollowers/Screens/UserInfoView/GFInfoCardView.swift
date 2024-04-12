//
//  GFInfoCardView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 4/9/24.
//

import SwiftUI


protocol CardView: View {
    
    var user:            User { get }
    var itemInfoOneType: ItemInfoType { get }
    var countOne:        Int { get }
    var itemInfoTwoType: ItemInfoType { get }
    var countTwo:        Int { get }
    var buttonTitle:     LocalizedStringKey { get }
    var backgroundColor: Color { get }
    var action:          () -> Void { get }
}


struct GFInfoCardView: CardView {
    
    var user:            User
    var itemInfoOneType: ItemInfoType
    var countOne:        Int
    var itemInfoTwoType: ItemInfoType
    var countTwo:        Int
    var buttonTitle:     LocalizedStringKey
    var backgroundColor: Color
    var action:          () -> Void
    
    var body: some View {
        VStack {
            HStack {
                GFItemInfoView(itemInfoType: itemInfoOneType, withCount: countOne)
                GFItemInfoView(itemInfoType: itemInfoTwoType, withCount: countTwo)
            }
            Button(action: action) { GFButton(buttonTitle, backgroundColor: backgroundColor) }
        }
        .padding(20)
        .frame(maxHeight: 140)
        .background(Color(.secondarySystemBackground))
        .clipShape(.rect(cornerRadius: 18))
    }
}


#Preview {
    GFInfoCardView(user:            MockData.sampleUser,
                   itemInfoOneType: .repos,
                   countOne:        14,
                   itemInfoTwoType: .following,
                   countTwo:        11,
                   buttonTitle:     "Continue",
                   backgroundColor: .blue,
                   action:          {}
    )
}
