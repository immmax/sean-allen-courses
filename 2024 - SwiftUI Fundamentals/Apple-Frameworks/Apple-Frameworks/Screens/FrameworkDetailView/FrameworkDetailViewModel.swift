//
//  FrameworkDetailViewModel.swift
//  Apple-Frameworks
//
//  Created by Maxim Datskiy on 3/23/24.
//

import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    
    let framework: Framework
    @Published var isShowingSafariView = false
    
    init(framework: Framework) {
        self.framework = framework
    }
}
