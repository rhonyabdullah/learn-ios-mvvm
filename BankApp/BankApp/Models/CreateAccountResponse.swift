//
//  CreateAccountResponse.swift
//  BankApp
//
//  Created by Rhony on 06/02/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

struct CreateAccountResponse: Decodable {
    let success: Bool
    let error: String?
}
