//
//  DetailWeatherInfro.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/8/24.
//

import SwiftUI

struct DetailWeatherInfo: View {
    let weather: WeatherModel
    
    //MARK: - Body
    var body: some View {
        ZStack {
            HStack {
                info("Humidity", value: weather.displayHumidity)
                Spacer()
                info("UV", value: weather.displayUV)
                Spacer()
                info("Feel Like", value: weather.displayFeelsLike)
            }
            .padding(16)
        }
        .background(.grayLight, in: .rect(cornerRadius: 16))
    }
}

// MARK: - Private
private extension DetailWeatherInfo {
    func info(_ text: String, value: String) -> some View {
        VStack(spacing: 2) {
            Text(text)
                .fontStyle(.footnote12RegularGrayMiddle)
            Text(value)
                .fontStyle(.footnote15MediumGray)
        }
    }
}

