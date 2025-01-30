//
//  HTTPClient.swift
//  MoviesApp
//
//  Created by Rhony on 18/01/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class HTTPClient {

    func getMoviesBY(
        search: String,
        completion: @escaping (Result<[Movie]?, NetworkError>) -> Void
    ) {
        guard let url = URL.forMoviesByName(search) else {
            return completion(.failure(.badURL))
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            guard let response = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            completion(.success(response.movies))
        }.resume()
    }

    func getMoviesDetailsById(
        id: String,
        completion: @escaping (Result<MovieDetail?, NetworkError>) -> Void
    ) {
        guard let url = URL.forMoviesById(id) else {
            return completion(.failure(.badURL))
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            guard let response = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            completion(.success(response))
        }.resume()
    }

}
