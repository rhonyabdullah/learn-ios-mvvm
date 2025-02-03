//
//  Account.swift
//  BankApp
//
//  Created by Rhony on 01/02/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

enum AccountType: String, Codable, CaseIterable {
    case saving
    case checking
}

extension AccountType {
    var title: String {
        switch self {
        case .saving:
            return "Savings"
        case .checking:
            return "Checking"
        }
    }
}

struct Account: Codable {
    let id: UUID
    let name: String
    let type: AccountType
    let balance: Double

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "accountType"
        case balance = "balance"
    }

    // Custom Decoder to handle invalid UUID formats
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let idString = try container.decode(String.self, forKey: .id)
        if let uuid = UUID(uuidString: idString) {
            self.id = uuid
        } else {
            // Handle invalid UUID format by generating a new UUID
            print("Warning: Invalid UUID '\(idString)', generating a new UUID.")
            self.id = UUID()
        }

        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(AccountType.self, forKey: .type)
        self.balance = try container.decode(Double.self, forKey: .balance)
    }

    init (id: UUID = UUID(), name: String, type: AccountType, balance: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.balance = balance
    }

}
