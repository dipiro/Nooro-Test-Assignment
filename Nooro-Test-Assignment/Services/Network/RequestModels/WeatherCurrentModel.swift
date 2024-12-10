//
//  WeatherCurrentModel.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/8/24.
//

struct WeatherCurrentModel: Codable, Sendable {
    let tempC: Double?
    let condition: WeatherConditionModel?
    let humidity: Int?
    let feelslikeC: Double?
    let uv: Double?

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case condition
        case humidity
        case feelslikeC = "feelslike_c"
        case uv
    }
}
