//
//  AccountSummaryScreen.swift
//  BankApp
//
//  Created by Rhony on 03/02/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct AccountSummaryScreen: View {

    @ObservedObject var viewModel = AccountSummaryViewModel()
    @State private var isPresented: Bool = false

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
                AddAccountScreen()
            }
        )
        .navigationBarItems(
            trailing: Button("Add Account") {
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
