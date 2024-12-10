//
//  PlacesScreenModelProtocol.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/9/24.
//


protocol PlacesScreenModelProtocol {
    var state: PlacesScreenStateType { get }
    
    init(_ state: PlacesScreenStateType, _ network: Networkable)
    
    func fetch(by cityName: String) async
    func fetchSelectedCity() async
    func selectWeather(_ selected: WeatherModel)
}