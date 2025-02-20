//
//  Store.swift
//  WeatherAppSwiftUI
//
//  Created by Rhony on 19/02/25.
//

import Foundation

class Store: ObservableObject {
    @Published var weatherList: [WeatherViewModel] = []
    @Published var selectedUnit: TemperatureUnit = .kelvin
    
    init () {
        selectedUnit = UserDefaults.standard.unit
    }

    func addWeather(_ weather: WeatherViewModel) {
        weatherList.append(weather)
    }
}
