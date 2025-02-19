//
//  AddWeatherViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Rhony on 19/02/25.
//

import Foundation

class AddWeatherViewModel: ObservableObject {

    @Published var city: String = ""

    func save(completion: @escaping (WeatherViewModel) -> Void) {
        Webservice().getWeatherByCity(city: city) { result in
            switch result {
            case .success(let weather):
                completion(WeatherViewModel(weather: weather))
            case .failure(let error):
                print(error)
            }
        }
    }
}
