//
//  AccountSummaryScreen.swift
//  BankApp
//
//  Created by Rhony on 03/02/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import SwiftUI

enum ActiveSheet {
    case addAccount
    case transferFunds
}

struct AccountSummaryScreen: View {

    @ObservedObject var viewModel = AccountSummaryViewModel()
    @State private var isPresented: Bool = false
    @State private var activeSheet: ActiveSheet = .addAccount

    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack {
                    AccountListView(
                        accounts: self.viewModel.accounts
                    ).frame(height: geometry.size.height / 2)
                    Text("\(viewModel.total.formatAsCurrency())")
                        .padding(.top, 8)
                    Spacer()
                    Button("Transfer Funds") {
                        self.activeSheet = .transferFunds
                        self.isPresented = true
                    }.padding()
                }
            }
        }
        .onAppear {
            self.viewModel.getAllAccounts()
        }
        .sheet(
            isPresented: $isPresented,
            onDismiss: {
                viewModel.getAllAccounts()
            },
            content: {
                switch self.activeSheet {
                    case .addAccount:
                        AddAccountScreen()
                    case .transferFunds:
                        TransferFundsScreen()
                }
            }
        )
        .navigationBarItems(
            trailing: Button("Add Account") {
                self.activeSheet = .addAccount
                self.isPresented = true
            }
        ).navigationBarTitle("Account Summary")
        .embedInNavigationView()
    }

}

// make sure glitch server is up and running first
#Preview {
    AccountSummaryScreen()
}
