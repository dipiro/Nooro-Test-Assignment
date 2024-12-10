//
//  PlacesScreenModel.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/9/24.
//

import SwiftUI

@Observable final class PlacesScreenModel: PlacesScreenModelProtocol {
    var state: PlacesScreenStateType
    
    // MARK: - Private
    private var network: Networkable
    
    // MARK: - Init
    init(_ state: PlacesScreenStateType = .noCity,
         _ network: Networkable = Network()) {
        self.state = state
        self.network = network
    }
}

// MARK: - Public
extension PlacesScreenModel {
    func fetch(by cityName: String) async {
        do {
            let model = try await network.fetch(by: .search(city: cityName), for: WeatherModel.self)
            await updateState(.loaded(weather: model))
        } catch {
            await updateState(.failed)
        }
    }
    
    func fetchSelectedCity() async {
        let selectedCity = Defaults.shared.selectedCity
        
        if selectedCity == "" {
            await updateState(.noCity)
        } else {
            await fetch(by: selectedCity)
        }
       
    }
    
    func selectWeather(_ selected: WeatherModel) {
        Defaults.shared.selectedCity = selected.displayCity
        Task {
            await updateState(.selected(weather: selected))
        }
    }
}

// MARK: - Private
private extension PlacesScreenModel {
    @MainActor func updateState(_ state: PlacesScreenStateType) {
        self.state = state
    }
}
