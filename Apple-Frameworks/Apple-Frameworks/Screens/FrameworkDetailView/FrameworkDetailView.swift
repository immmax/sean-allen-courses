//
//  DetailView.swift
//  Apple-Frameworks
//
//  Created by Maxim Datskiy on 3/17/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    @State private var isShowingSafariView = false
    
    let framework: Framework
    
    var body: some View {
        VStack {
            XDismissButton()
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
            .fullScreenCover(isPresented: $isShowingSafariView) { // instead if sheet
                SafariView(url: URL(string: framework.urlString) ?? URL(string: "https://www.apple.com")!)
            }
        }
        .padding()
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}
