//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Maxim Datskiy on 3/16/24.
//

import SwiftUI

struct FrameworkGridView: View {
    @StateObject var viewModel = FrameworkGridViewModel()
        
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                        .onTapGesture {
                            viewModel.selectedFramework = framework
                        }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .preferredColorScheme(.dark)
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: viewModel.selectedFramework!))
            }
        }
    }
}

#Preview {
    FrameworkGridView()
}
