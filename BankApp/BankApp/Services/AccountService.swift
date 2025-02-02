//
//  AccountService.swift
//  BankApp
//
//  Created by Rhony on 01/02/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}

class AccountService {

    private init() { }

    static let shared = AccountService()

    func getAllAccounts(completion: @escaping (Result<[Account]?, NetworkError>) -> Void) {
        guard let url = URL.urlForAccounts() else {
            return completion(.failure(.badUrl))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            let accounts = try? JSONDecoder().decode([Account].self, from: data)
            if accounts == nil {
                completion(.failure(.decodingError))
            } else {
                completion(.success(accounts))
            }
        }.resume()
    }
}
