//
//  PlaceCell.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/8/24.
//

import SwiftUI

struct PlaceCell: View {
    let weather: WeatherModel
    
    var onEvent: (OnEvent) -> ()
    
    // MARK: -
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Text(weather.displayCity)
                        .fontStyle(.subtitle20Bold)
                    Text(weather.displayTemperatureString)
                        .fontStyle(.title60Bold)
                }
                
                Spacer()
                
                image
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 30)
        }
        .background(.grayLight, in: .rect(cornerRadius: 16))
        .frame(height: Const.cellHeight)
        .onTapGesture {
            onEvent(.cellTapped)
        }
    }
}

// MARK: - Public
extension PlaceCell {
    enum OnEvent {
        case cellTapped
    }
}

// MARK: - Private
private extension PlaceCell {
    var image: some View {
        AsyncImage(url: weather.displayIconConditionUrl) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

// MARK: - Constans
fileprivate struct Const {
    static let cellHeight: CGFloat = 117
}

// MARK: - Preview
#Preview {
    PlaceCell(weather: Preview.weather, onEvent: { _ in })
}

