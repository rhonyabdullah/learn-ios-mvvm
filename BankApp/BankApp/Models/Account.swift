//
//  Account.swift
//  BankApp
//
//  Created by Rhony on 01/02/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

enum AccountType: String, Codable, CaseIterable {
    case savings
    case checking
}

extension AccountType {
    var title: String {
        switch self {
            case .savings:
                return "Savings"
            case .checking:
                return "Checking"
        }
    }
}

struct Account: Codable {
    
}
