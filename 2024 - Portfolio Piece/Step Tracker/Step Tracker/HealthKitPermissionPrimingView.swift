//
//  HealthKitPermissionPrimingView.swift
//  Step Tracker
//
//  Created by Maxim Datskiy on 5/2/24.
//

import SwiftUI
import HealthKitUI

struct HealthKitPermissionPrimingView: View {
    
    @Environment(HealthKitManager.self) private var hkManager
    @Environment(\.dismiss) var dismiss
    @State private var isShowingHealthKitPermissions = false
    
    var description = """
    This app displays your steps and weight date in interactive charts.
    
    You can also add new steps or weight data to your Apple Health from this app. Your data is private and secured.
    """
    
    var body: some View {
        VStack(spacing: 130) {
            VStack(alignment: .leading, spacing: 10) {
                Image(.appleHealth)
                    .resizable()
                    .frame(width: 90, height: 90)
                    .shadow(color: .gray.opacity(0.3), radius: 16)
                    .padding(.bottom, 20)
                
                Text("Apple Health Integration")
                    .font(.title.bold())
                
                Text(description)
                    .foregroundStyle(.secondary)
            }
            
            Button("Connect Apple Health") {
                isShowingHealthKitPermissions = true
            }
            .buttonStyle(.bordered)
            .tint(.pink)
        }
        .padding(30)
        .healthDataAccessRequest(
            store: hkManager.store,
            shareTypes: hkManager.types,
            readTypes: hkManager.types,
            trigger: isShowingHealthKitPermissions) { result in
                switch result {
                case .success:
                    Task { @MainActor in dismiss() }
                case .failure:
                    //handle the error later
                    Task { @MainActor in dismiss() }
                }
            }
    }
}

#Preview {
    HealthKitPermissionPrimingView()
        .environment(HealthKitManager())
}
