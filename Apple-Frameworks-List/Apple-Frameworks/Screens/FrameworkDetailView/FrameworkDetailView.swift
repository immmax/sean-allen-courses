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
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 8))
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
//                AFButton(title: "Learn More")
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
//            .foregroundStyle(.yellow)
//            .buttonBorderShape(.roundedRectangle(radius: 20))
            .tint(.red)
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
