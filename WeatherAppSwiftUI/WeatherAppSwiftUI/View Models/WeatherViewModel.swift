//
//  WeatherViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Rhony on 19/02/25.
//

import Foundation

struct WeatherViewModel {
    private let weather: Weather

    init(weather: Weather) {
        self.weather = weather
    }

    var temperature: Double {
        return weather.temperature
    }

    var city: String {
        return weather.city
    }

    var icon: String {
        return weather.icon
    }

    var sunrise: Date {
        return weather.sunrise
    }

    var sunset: Date {
        return weather.sunset
    }
}
