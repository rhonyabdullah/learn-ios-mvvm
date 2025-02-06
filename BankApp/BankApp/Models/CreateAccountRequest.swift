//
//  CreateAccountRequest.swift
//  BankApp
//
//  Created by Rhony on 06/02/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

struct CreateAccountRequest: Codable {
    let name: String
    let accountType: String
    let balance: Double
}
