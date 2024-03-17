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
            List{
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(value: framework) {
                        FrameworkTitleView(framework: framework)
                    }
                }
            }
            .navigationTitle(" Frameworks")
            .navigationDestination(for: Framework.self) { framework in
                FrameworkDetailView(framework: framework)
            }
            .preferredColorScheme(.dark)
        }
        .tint(Color(.label))
    }
}

#Preview {
    FrameworkGridView()
}
