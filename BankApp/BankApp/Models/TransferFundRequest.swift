//
//  TransferAccountFund.swift
//  BankApp
//
//  Created by Rhony on 12/02/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

struct TransferFundRequest: Codable {
    let accountFromId: String
    let accountToId: String
    let amount: Double
}
