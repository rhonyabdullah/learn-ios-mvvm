//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Rhony on 31/01/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieDetailView: View {

    let viewModel: MovieDetailViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                URLImage(url: viewModel.poster)
                    .cornerRadius(10)

                Text(viewModel.title)
                    .font(.title)

                Text(viewModel.plot)
                Text("Director").fontWeight(.bold)
                Text(viewModel.director)
                HStack {
                    Rating(rating: .constant(viewModel.rating))
                    Text("(\(viewModel.rating)/10)")
                }.padding(.top, 10)
                Spacer()
            }.padding()
                .navigationBarTitle(self.viewModel.title)
        }
    }
}

#Preview {
    let movieDetail = MovieDetail(
        title: "Batman",
        year: "1989",
        rated: "PG-13",
        plot: "The Dark Knight of Gotham City begins his war on crime with his first major enemy being Jack Napier, a criminal who becomes the clownishly homicidal Joker.",
        director: "Tim Burton",
        actors: "Michael Keaton, Jack Nicholson, Kim Basinger",
        imdbRating: "7.5",
        poster: "https://m.media-amazon.com/images/M/MV5BYzZmZWViM2EtNzhlMi00NzBlLWE0MWEtZDFjMjk3YjIyNTBhXkEyXkFqcGc@._V1_SX300.jpg",
        imdbID: "tt0096895"
    )
    return MovieDetailView(viewModel: MovieDetailViewModel(movieDetail: movieDetail)).embedNavigationView()
}
