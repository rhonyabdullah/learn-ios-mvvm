//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Rhony on 27/01/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

class MovieListViewModel: ViewModelBase {

    @Published var movies = [MovieViewModel]() //notify subscriber
    let httpClient = HTTPClient()

    func searchByName(_ name: String) {

        if name.isEmpty {
            return
        }
        
        self.loadingState = .loading

        httpClient.getMoviesBY(search: name.trimmedAndEscaped()) { result in
            switch result {
            case .success(let success):
                if let movies = success {
                    DispatchQueue.main.async { // to update the movies should be on main thread
                        self.movies = movies.map(MovieViewModel.init)
                        self.loadingState = .success
                    }
                }
            case .failure(let failure):
                print(failure.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
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
