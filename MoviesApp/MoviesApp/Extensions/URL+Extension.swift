//
//  URL+Extension.swift
//  MoviesApp
//
//  Created by Rhony on 20/01/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

extension URL {
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "\(Constants.BASE_URL)/?apikey=\(APIKeys.API_KEYS)&s=\(name)")
    }
    
    static func forMoviesById(_ id: String) -> URL? {
        return URL(string: "\(Constants.BASE_URL)/?apikey=\(APIKeys.API_KEYS)&i=\(id)")
    }
}
