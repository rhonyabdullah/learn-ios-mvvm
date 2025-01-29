//
//  MovieListScreen.swift
//  MoviesApp
//
//  Created by Rhony on 27/01/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieListScreen: View {

    @ObservedObject private var movieListVM: MovieListViewModel
    @State private var searchTerm: String = ""

    init() {
        self.movieListVM = MovieListViewModel()
    }

    var body: some View {
        let listView = MovieListView(movies: self.movieListVM.movies)
        VStack {
            TextField(
                "Search",
                text: $searchTerm,
                onEditingChanged: { _ in },
                onCommit: {
                    self.movieListVM.searchByName(self.searchTerm)
                }
            ).textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Spacer()
            .navigationBarTitle("Movies")

            if self.movieListVM.loadingState == .success {
                listView
            } else if self.movieListVM.loadingState == .failed {
                FailedView()
            } else if self.movieListVM.loadingState == .loading {
                LoadingView()
            }
            Spacer()
        }.embedNavigationView()
    }
}

#Preview {
    MovieListScreen()
}

// second way to provide preview
struct MovieListScreen_Preview: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
