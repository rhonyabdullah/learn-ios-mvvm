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
    
    let id = UUID()
    
    func getTemperatureByUnit(unit: TemperatureUnit) -> Double {
        switch unit {
            case .kelvin:
                return weather.temperature
            case .celsius:
                return weather.temperature - 273.15
            case .fahrenheit:
//                return 1.8 * (weather.temperature - 273.15) + 32
                return (weather.temperature - 273.15) * 9.0 / 5.0 + 32.0
        }
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
