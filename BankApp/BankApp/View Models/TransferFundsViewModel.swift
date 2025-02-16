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
    var amount: String = ""

    var isAmountValid: Bool {
        guard let userAmount = Double(amount) else {
            return false
        }
        return userAmount <= 0 ? false : true
    }

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

    func submitTransfer() {
        
        if !isValid() {
            return
        }
        
        guard let fromAccount = fromAccount,
            let toAccount = toAccount,
            let amount = Double(self.amount)
            else {
            return
        }
        let transferFundRequest = TransferFundRequest(
            accountFromId: fromAccount.accountID.uuidString,
            accountToId: toAccount.accountID.uuidString,
            amount: amount
        )
        AccountService.shared.transferFunds(transferFundRequest: transferFundRequest) { result in
            
        }
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
    
    private func isValid() -> Bool {
        return isAmountValid
    }

}
