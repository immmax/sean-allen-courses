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
                
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                        .frame(width: 300, height: 55)
                        .foregroundStyle(Color(.systemBackground))
                    
                    
                    TextField(text: $viewModel.username) {
                        Text("Enter a username to search")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                    }
                    .submitLabel(.go)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .padding(.horizontal, 80)
                    .onSubmit { viewModel.showFollowersList() }
                }
                .padding(.vertical, 40)
                
                Spacer()
                
                Button {
                    viewModel.showFollowersList()
                } label: {
                    GFButton(title: "Get Followers")
                        .padding(.bottom, 60)
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
        }
    }
}

#Preview {
    SearchView()
}
