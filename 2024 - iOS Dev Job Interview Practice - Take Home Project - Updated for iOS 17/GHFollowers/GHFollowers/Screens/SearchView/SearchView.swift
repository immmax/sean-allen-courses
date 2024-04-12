//
//  SearchView.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/27/24.
//

import SwiftUI

struct SearchView: View {
    
    @State private  var viewModel = SearchViewModel()
    
    init() { UITextField.appearance().clearButtonMode = .whileEditing }
    
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
                    .padding(.vertical, 40)
                    .onSubmit { viewModel.showFollowersList() }
                
                #warning("Consider not using Spacer.")
                Spacer()
                
                GFButton("Get Followers", systemImageName: SFSymbols.getFollowersButton, color: .green) {
                    viewModel.showFollowersList()
                }
                .padding(.bottom, 60)
                .padding(.horizontal, 40)
            }
            .background(Color(.systemBackground))
            .toolbar(.hidden)
            
            .onAppear {
                viewModel.username = ""
            }
            
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
            
            .navigationDestination(isPresented: $viewModel.isShowingFollowersListView) {
                FollowerListView(username: viewModel.username)
            }
            
            .navigationTitle("Search")
        }
    }
}


#Preview {
    SearchView()
}
