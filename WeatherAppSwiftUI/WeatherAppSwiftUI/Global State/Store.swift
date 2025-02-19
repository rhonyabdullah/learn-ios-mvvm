//
//  Store.swift
//  WeatherAppSwiftUI
//
//  Created by Rhony on 19/02/25.
//

import Foundation

class Store: ObservableObject {
    @Published var weatherList: [WeatherViewModel] = []

    func addWeather(_ weather: WeatherViewModel) {
        weatherList.append(weather)
    }
}
