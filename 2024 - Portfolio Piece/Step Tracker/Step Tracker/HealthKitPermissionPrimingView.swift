//
//  HealthKitPermissionPrimingView.swift
//  Step Tracker
//
//  Created by Maxim Datskiy on 5/2/24.
//

import SwiftUI

struct HealthKitPermissionPrimingView: View {
    
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
                // more code to come
            }
            .buttonStyle(.bordered)
            .tint(.pink)
        }
        .padding(30)
    }
}

#Preview {
    HealthKitPermissionPrimingView()
}
