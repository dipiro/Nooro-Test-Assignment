//
//  DetailWeather.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/8/24.
//

import SwiftUI

struct DetailWeather: View {
    let weather: WeatherModel
    
    // MARK: - Body
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 36) {
                icon
                
                VStack(spacing: 16) {
                    title
                    temp
                }
                
                DetailWeatherInfo(weather: weather)
                    .frame(width: 274)
            }
        }
        .scrollDismissesKeyboard(.interactively)
    }
}

// MARK: - Private
private extension DetailWeather {
    var icon: some View {
        AsyncImage(url: weather.displayIconConditionUrl) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(height: 140)
    }
    
    var title: some View {
        HStack(spacing: 12) {
            Text(weather.displayCity)
                .fontStyle(.title30Bold)
            AppConstants.Icon.location.image
        }
    }
    
    var temp: some View {
        Text(weather.displayTemperatureString)
            .fontStyle(.title70Bold)
    }
}

// MARK: - Preview
#Preview {
    DetailWeather(weather: Preview.weather)
}
