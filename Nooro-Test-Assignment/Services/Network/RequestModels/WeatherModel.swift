//
//  WeatherModel.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/8/24.
//

import Foundation

struct WeatherModel: Decodable {
    let location: WeatherLocationModel?
    let current: WeatherCurrentModel?
}

// MARK: -
extension WeatherModel {
    
    
    var displayCity: String {
        location?.name ?? ""
    }
    
    var displayTemperature: Double {
        current?.tempC ?? 0.0
    }
    
    var displayTemperatureString: String {
        "\(displayTemperature)°"
    }
    
    var displayIconConditionUrl: URL? {
        if let urlString = current?.condition?.icon {
            return URL(string: "https:\(urlString)")
        }
        
        return nil
    }
    
    var displayHumidity: String {
        "\(current?.humidity ?? 0)%"
    }
    
    var displayUV: String {
        "\(current?.uv ?? 0)"
    }
    
    var displayFeelsLike: String {
        "\(current?.feelslikeC ?? 0)°"
    }
}
