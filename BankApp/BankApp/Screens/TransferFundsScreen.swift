//
//  TransferFundsScreen.swift
//  BankApp
//
//  Created by Rhony on 12/02/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct TransferFundsScreen: View {

    @ObservedObject private var viewModel = TransferFundsViewModel()
    @State private var showSheet: Bool = false
    @State private var isFromAccount = true

    var actionSheetButtons: [Alert.Button] {
        var actionButtons = viewModel.filteredAccounts.map { account in
            Alert.Button.default(
                Text("\(account.name) (\(account.accountType))")
            ) {
                if self.isFromAccount {
                    viewModel.fromAccount = account
                } else {
                    viewModel.toAccount = account
                }
            }
        }

        actionButtons.append(Alert.Button.cancel())
        return actionButtons
    }

    var body: some View {
        VStack {
            AccountListView(accounts: viewModel.accounts)
                .frame(height: 300)
            TransferFundsAccountSelectionView(
                viewModel: self.viewModel,
                showSheet: $showSheet,
                isFromAccount: $isFromAccount
            )
            Spacer()
        }.onAppear {
            viewModel.populateAccounts()
        }.actionSheet(isPresented: $showSheet) {
            ActionSheet(
                title: Text("Transfer Funds"),
                message: Text("Choose an account"),
                buttons: self.actionSheetButtons
            )
        }.navigationBarTitle("Transfer Funds")
            .embedInNavigationView()
    }
}

#Preview {
    TransferFundsScreen()
}

struct TransferFundsAccountSelectionView: View {

    @ObservedObject var viewModel: TransferFundsViewModel
    @Binding var showSheet: Bool
    @Binding var isFromAccount: Bool

    var body: some View {
        VStack(spacing: 12) {
            Button("From \(self.viewModel.fromAccountType)") {
                isFromAccount = true
                showSheet = true
            }.frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.green)
                .foregroundColor(Color.white)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))

            Button("To \(self.viewModel.toAccountType)") {
                isFromAccount = false
                showSheet = true
            }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.green)
                .foregroundColor(Color.white)
                .opacity(viewModel.fromAccount != nil ? 1.0 : 05)
                .disabled(viewModel.fromAccount != nil)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        }
    }
}
