//
//  Preview.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/8/24.
//

import Foundation

struct Preview {
    static let weather: WeatherModel = .init(
        location: .init(
            name: "London"
        ),
        current: .init(
            tempC: 8.4,
            condition: .init(
                text: "Partly cloudy",
                icon: "//cdn.weatherapi.com/weather/64x64/night/116.png",
                code: 1003
            ),
            humidity: 87,
            feelslikeC: 4.8,
            uv: 0.0
        )
    )
}
