//
//  TransferFundResponse.swift
//  BankApp
//
//  Created by Rhony on 12/02/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

struct TransferFundResponse: Decodable {
    let success: Bool
    let error: String?
}
