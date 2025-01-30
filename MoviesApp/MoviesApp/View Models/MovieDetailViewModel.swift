//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by Rhony on 30/01/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

class MovieDetailViewModel: ViewModelBase {

    private var movieDetail: MovieDetail?

    private let httpClient = HTTPClient()

    init(movieDetail: MovieDetail? = nil) {
        super.init()
        self.movieDetail = movieDetail
    }

    func getDetailsByID(movieID: String) {
        self.loadingState = .loading
        httpClient.getMoviesDetailsById(id: movieID) { result in
            switch result {
            case .success(let movieDetail):
                DispatchQueue.main.async {
                    self.movieDetail = movieDetail
                    self.loadingState = .success
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }

    var title: String {
        self.movieDetail?.title ?? ""
    }

    var poster: String {
        self.movieDetail?.poster ?? ""
    }

    var plot: String {
        self.movieDetail?.plot ?? ""
    }

//    ceil will doing the round up event it is 0.1
//    Original IMDb Rating    Double(...)    ceil(...)    Int(...) (Final Output)
//    "7.2"    7.2    8.0    8
//    "5.8"    5.8    6.0    6
//    "9.0"    9.0    9.0    9
//    "4.1"    4.1    5.0    5
    var rating: Int {
        get {
            let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }

    var director: String {
        self.movieDetail?.director ?? ""
    }
}
