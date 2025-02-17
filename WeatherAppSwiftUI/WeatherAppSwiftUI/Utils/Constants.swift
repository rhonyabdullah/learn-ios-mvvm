//
//  Constants.swift
//  WeatherAppSwiftUI
//
//  Created by Mohammad Azam on 3/5/21.
//

import Foundation

struct Constants {
    
    private static let BASE_URL = "https://api.openweathermap.org/data/2.5"
    
    struct Urls {
        
        static func weatherByCity(city: String) -> URL? {
            return URL(string: "\(BASE_URL)/appid=\(APIKeys.openWeatherMapApiKey)&weather?q=\(city.escaped())")
        }
        
        static func weatherUrlAsStringByIcon(icon: String) -> String {
            return "https://openweathermap.org/img/w/\(icon).png"
        }
    }
}
