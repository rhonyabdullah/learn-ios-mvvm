//
//  ContentView.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 7/29/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")

        //Will be removed, this only for testing purposes
        .onAppear {
            HTTPClient().getMoviesBY(search: "batman") { result in
                switch result {
                case .success(let movies):
                    print(movies)
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
