//
//  AccountSummaryViewModel.swift
//  BankApp
//
//  Created by Rhony on 02/02/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

class AccountSummaryViewModel: ObservableObject {

    private var _accountModel: [Account] = []

    @Published var accounts: [AccountViewModel] = []

    var total: Double {
        accounts.map { $0.balance }.reduce(0, +)
    }

    func getAllAccounts() {
        AccountService.shared.getAllAccounts { result in
            switch result {
            case .success(let accounts):
                if let accounts = accounts {
                    self._accountModel = accounts
                    DispatchQueue.main.async {
                        self.accounts = accounts.map(AccountViewModel.init)
                    }
                }
            case .failure(let error):
                print("get all accounts error: \(error.localizedDescription)")
            }
        }
    }
}

class AccountViewModel {
    var account: Account

    init(account: Account) {
        self.account = account
    }

    var name: String {
        self.account.name
    }

    var accountID: UUID {
        account.id
    }

    var accountType: String {
        account.type.title
    }

    var balance: Double {
        account.balance
    }

}
