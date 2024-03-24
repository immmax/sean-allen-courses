//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Maxim Datskiy on 3/17/24.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)

}
