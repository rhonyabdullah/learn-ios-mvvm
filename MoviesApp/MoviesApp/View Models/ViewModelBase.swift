//
//  ViewModelBase.swift
//  MoviesApp
//
//  Created by Rhony on 29/01/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

enum LoadingState {
    case none
    case loading
    case success
    case failed
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
