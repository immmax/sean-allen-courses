//
//  SearchView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/27/24.
//

import SwiftUI

struct SearchView: View {
    @State private var username = ""
    @State private var isShowingFollowersListView = false
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
                        Text("Enter a username to search")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                    }
                    .submitLabel(.go)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .padding(.horizontal, 80)
                    .onSubmit { showFollowersList() }
                }
                .padding(.vertical, 40)
                
                Spacer()
                
                Button {
                    showFollowersList()
                } label: {
                    Text("Get Followers")
                        .frame(width: 250, height: 50)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.bottom, 60)
                        .tint(.white)
                }
            }
            .background(Color(.systemBackground))
            .navigationTitle("Search")
            .toolbar(.hidden)
            .navigationDestination(isPresented: $isShowingFollowersListView) {
                FollowerListView(username: username)
            }
        }
    }
    
    func showFollowersList() {
        guard !username.isEmpty else {
            print("No username")
            return
        }
        isShowingFollowersListView = true
    }
}

#Preview {
    SearchView()
}
