//
//  TransferFundsViewModel.swift
//  BankApp
//
//  Created by Rhony on 12/02/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

class TransferFundsViewModel: ObservableObject {

    var fromAccount: AccountViewModel?
    var toAccount: AccountViewModel?

    @Published var accounts: [AccountViewModel] = []

    var filteredAccounts: [AccountViewModel] {
        return if fromAccount == nil {
            accounts
        } else {
            accounts.filter {
                guard let fromAccount = self.fromAccount else {
                    return false
                }
                return $0.accountID != fromAccount.accountID
            }
        }
    }

    var fromAccountType: String {
        fromAccount != nil ? fromAccount!.accountType : ""
    }

    var toAccountType: String {
        toAccount != nil ? toAccount!.accountType : ""
    }

    func populateAccounts() {
        AccountService.shared.getAllAccounts { result in
            switch result {
            case .success(let accounts):
                if let accounts = accounts {
                    DispatchQueue.main.async {
                        self.accounts = accounts.map(AccountViewModel.init)
                    }
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }

}
