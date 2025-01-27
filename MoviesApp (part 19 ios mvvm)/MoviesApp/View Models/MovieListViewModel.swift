//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Rhony on 27/01/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

class MovieListViewModel: ObservableObject {

    @Published var movies = [MovieViewModel]() //notify subscriber
    let httpClient = HTTPClient()

    func searchByName(_ name: String) {
        httpClient.getMoviesBY(search: name) { result in
            switch result {
            case .success(let success):
                if let movies = success {
                    DispatchQueue.main.async { // to update the movies should be on main thread
                        self.movies = movies.map(MovieViewModel.init)
                    }
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}

struct MovieViewModel {

    let movie: Movie

    var imdbId: String {
        movie.imdbId
    }

    var title: String {
        movie.title
    }

    var poster: String {
        movie.poster
    }

    var year: String {
        movie.year
    }
}
