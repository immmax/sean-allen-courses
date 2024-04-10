//
//  SearchView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/27/24.
//

import SwiftUI

struct SearchView: View {
    @State private  var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Image(.ghLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 230, height: 230)
                    .padding(.top, 100)
                
                TextField("Enter a username", text: $viewModel.username)
                    .textFieldStyle(RoundedTextFieldStyle())
                    .onSubmit { viewModel.showFollowersList() }
                    .padding(.vertical, 40)
                
                Spacer()
                
                Button {
                    viewModel.showFollowersList()
                } label: {
                    GFButton("Get Followers")
                        .padding(.bottom, 60)
                        .padding(.horizontal, 50)
                }
            }
            .background(Color(.systemBackground))
            .navigationTitle("Search")
            .toolbar(.hidden)
            .navigationDestination(isPresented: $viewModel.isShowingFollowersListView) {
                FollowerListView(username: viewModel.username)
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
            .onAppear {
                viewModel.username = ""
            }
        }
    }
}

#Preview {
    SearchView()
}
