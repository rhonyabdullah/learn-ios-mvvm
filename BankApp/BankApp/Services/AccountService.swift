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
    
    func createAccount(
        createAccountrequest: CreateAccountRequest,
        completion: @escaping (Result<CreateAccountResponse, NetworkError>) -> Void
    ) {
        guard let url = URL.urlForCreateAccounts() else {
            return completion(.failure(.badUrl))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(createAccountrequest)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            let createAccountResponse = try? JSONDecoder().decode(CreateAccountResponse.self, from: data)
            if let createAccountResponse = createAccountResponse {
                return completion(.success(createAccountResponse))
            } else {
                return completion(.failure(.decodingError))
            }
        }.resume()
    }
}
