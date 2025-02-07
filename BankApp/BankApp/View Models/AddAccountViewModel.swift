//
//  AddAccountViewModel.swift
//  BankApp
//
//  Created by Rhony on 07/02/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

class AddAccountViewModel: ObservableObject {

    var name: String = ""
    var accountType: AccountType = .checking
    var balance: String = ""
    @Published var errorMessage: String = ""

}

extension AddAccountViewModel {
    private var isNameValid: Bool {
        !name.isEmpty
    }

    private var isBalanceValid: Bool {
        guard let userBalance = Double(balance) else {
            return false
        }

        return userBalance <= 0 ? false : true
    }

    private func isValid() -> Bool {
        var errors = [String]()
        if !isNameValid {
            errors.append("Name is required")
        }
        if !isBalanceValid {
            errors.append("Balance must be positive number")
        }

        if !errors.isEmpty {
            self.errorMessage = errors.joined(separator: "\n")
            return false
        }

        return true
    }
}

extension AddAccountViewModel {
    func createAccount(completion: @escaping (Bool) -> Void) {

        if !isValid() {
            return completion(false)
        }

        let request = CreateAccountRequest(
            name: name,
            accountType: accountType.rawValue,
            balance: Double(balance) ?? 0
        )

        AccountService.shared.createAccount(createAccountrequest: request) { Result in

        }
    }
}
