//
//  PlacesScreenStateType.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/9/24.
//

enum PlacesScreenStateType {
    case noCity, loaded(weather: WeatherModel), selected(weather: WeatherModel), failed
}
