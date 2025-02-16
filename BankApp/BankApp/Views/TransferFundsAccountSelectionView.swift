//
//  TransferFundsAccountSelectionView.swift
//  BankApp
//
//  Created by Rhony on 16/02/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct TransferFundsAccountSelectionView: View {

    @ObservedObject var viewModel: TransferFundsViewModel
    @Binding var showSheet: Bool
    @Binding var isFromAccount: Bool

    var body: some View {
        VStack(spacing: 12) {
            Button("From \(self.viewModel.fromAccountType)") {
                isFromAccount = true
                showSheet = true
            }.frame(maxWidth: .infinity, minHeight: 35)
                .background(Color.green)
                .foregroundColor(Color.white)
                .clipShape(.rect(cornerRadius: 4))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))

            Button("To \(self.viewModel.toAccountType)") {
                isFromAccount = false
                showSheet = true
            }
                .frame(maxWidth: .infinity, minHeight: 35)
                .background(Color.green)
                .foregroundColor(Color.white)
                .opacity(viewModel.fromAccount != nil ? 1.0 : 0.5)
                .disabled(viewModel.fromAccount == nil)
                .clipShape(.rect(cornerRadius: 4))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))

            TextField("Amount", text: $viewModel.amount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        }
    }
}
