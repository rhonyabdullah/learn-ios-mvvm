//
//  MovieDetail.swift
//  MoviesApp
//
//  Created by Rhony on 30/01/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

struct MovieDetail: Decodable {
    let title: String
    let year: String
    let rated: String
    let plot: String
    let director: String
    let actors: String
    let imdbRating: String
    let poster: String
    let imdbID: String
    
    private enum CodingKeys : String, CodingKey {
        case title = "Title"
        case year = "Released"
        case rated = "Rated"
        case plot = "Plot"
        case director = "Director"
        case actors = "Actors"
        case imdbRating = "imdbRating"
        case poster = "Poster"
        case imdbID = "imdbID"
    }
}
