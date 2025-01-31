//
//  MovieDetailScreen.swift
//  MoviesApp
//
//  Created by Rhony on 31/01/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieDetailScreen: View {

    let imdbID: String
    @ObservedObject var viewModel = MovieDetailViewModel()

    var body: some View {
        VStack {
            if viewModel.loadingState == .loading {
                LoadingView()
            } else if viewModel.loadingState == .failed {
                FailedView()
            } else if viewModel.loadingState == .success {
                MovieDetailView(viewModel: viewModel)
            }
        }.onAppear {
            viewModel.getDetailsByID(movieID: imdbID)
        }
    }
}

#Preview {
    MovieDetailScreen(imdbID: "tt0096895")
}
