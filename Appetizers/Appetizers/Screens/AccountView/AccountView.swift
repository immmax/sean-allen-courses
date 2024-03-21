//
//  AccountView.swift
//  Appetizers
//
//  Created by Maxim Datskiy on 3/17/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $viewModel.firstName)
                        .textInputAutocapitalization(.words)
                    
                    TextField("Last Name", text: $viewModel.lastName)
                        .textInputAutocapitalization(.words)
                    
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday",
                               selection: $viewModel.birthday,
                               displayedComponents: .date)
                    
                    Button("Save Changes") {
                        viewModel.saveChanges()
                    }
                    .tint(.brandPrimary)
                }
                
                Section("Requests") {
                    Toggle("Extra Napkins", isOn: $viewModel.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.frequentRefills)
                }
            }
            .navigationTitle("☺️ Account")
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
            )
        }
    }
}

#Preview {
    AccountView()
}
