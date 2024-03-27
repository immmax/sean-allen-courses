//
//  SearchView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/27/24.
//

import SwiftUI

struct SearchView: View {
    @State private var username = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Image(.ghLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 230, height: 230)
                    .padding(.top, 100)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                        .frame(width: 300, height: 55)
                        .foregroundStyle(Color(.systemBackground))
                        
                    
                    TextField(text: $username) {
                        Text("Enter a username")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                    }
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .padding(.horizontal, 80)
                }
                .padding(.vertical, 40)
                    
                Spacer()
                
                
                Button {
                    print(username)
                } label: {
                    Text("Get Followers")
                        .frame(width: 250, height: 30)
                }
                .padding(.bottom, 60)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .tint(.green)
            }
            .background(Color(.systemBackground))
//            .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchView()
}
