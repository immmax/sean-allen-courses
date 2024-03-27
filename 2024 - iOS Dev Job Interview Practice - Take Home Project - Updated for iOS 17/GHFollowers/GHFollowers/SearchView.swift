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
                    .frame(width: 200, height: 200)
                    .padding(.top, 80)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                        .frame(width: 250, height: 50)
                        .foregroundStyle(Color(.systemBackground))
                        
                    
                    TextField(text: $username) {
                        Text("Enter a username")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                    }
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .padding(.horizontal, 100)
                }
                .padding(.vertical)
                    
                Spacer()
                
                
                Button {
                    print(username)
                } label: {
                    Text("Search")
                        .frame(width: 200, height: 50)
                }
                .padding(.bottom, 50)
                .buttonStyle(.bordered)
//                .controlSize(.large)
                .tint(.green)
            }
            .background(Color(.systemBackground))
            .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchView()
}
