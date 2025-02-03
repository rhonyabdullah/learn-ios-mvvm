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

    var body: some View {
        VStack {
            AccountListView(accounts: viewModel.accounts)
            Text("\(viewModel.total.formatAsCurrency())")
                .padding(.top, 8)
        }.onAppear {
            self.viewModel.getAllAccounts()
        }
    }

}

// make sure glitch server is up and running first
#Preview {
    AccountSummaryScreen()
}
