//
//  DetailView.swift
//  Apple-Frameworks
//
//  Created by Maxim Datskiy on 3/17/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @ObservedObject var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        VStack {
            XDismissButton()
            
            Spacer()
            
            FrameworkTitleView(framework: viewModel.framework)
            
            Text(viewModel.framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Link(destination: URL(string: viewModel.framework.urlString) ?? URL(string: "https://www.apple.com")!) {
                AFButton(title: "Learn More")
            }
            
//            Button {
//                viewModel.isShowingSafariView = true
//            } label: {
//                AFButton(title: "Learn More")
//            }
//            .fullScreenCover(isPresented: $viewModel.isShowingSafariView) { // instead if sheet
//                SafariView(url: URL(string: viewModel.framework.urlString) ?? URL(string: "https://www.apple.com")!)
//            }
        }
        .padding()
    }
}

#Preview {
    FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: MockData.sampleFramework))
}
