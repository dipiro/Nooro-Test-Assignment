//
//  WeatherConditionModel.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/8/24.
//

struct WeatherConditionModel: Codable, Sendable {
    let text, icon: String?
    let code: Int?
}
