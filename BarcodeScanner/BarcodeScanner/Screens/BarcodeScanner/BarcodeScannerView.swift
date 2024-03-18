//
//  BarcodeScannerView.swift
//  BarcodeScanner
//
//  Created by Maxim Datskiy on 3/17/24.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                ScannerView(
                    scannedCode: $viewModel.scannedCode,
                    alertItem: $viewModel.alertItem
                )
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(viewModel.statusTextColor)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(
                    title: Text(alertItem.title),
                    message: Text(alertItem.message),
                    dismissButton: alertItem.dismissButton
                )
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
