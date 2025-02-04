//
//  AccountListView.swift
//  BankApp
//
//  Created by Rhony on 03/02/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct AccountListView: View {

    let accounts: [AccountViewModel]

    var body: some View {
        List(accounts, id: \.accountID) { account in
            AccountCell(account: account)
        }
    }
}

#Preview {
    let account = Account(id: UUID(), name: "John Doe", type: .saving, balance: 10000)
    let accountVM = AccountViewModel(account: account)
    return AccountListView(accounts: [accountVM])
}

struct AccountCell: View {

    let account: AccountViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(account.name)
                    .font(.headline)
                Text(account.accountType)
                    .opacity(0.5)
            }
            Spacer()
            Text("\(account.balance.formatAsCurrency())")
                .foregroundColor(Color.green)
        }
    }
}
