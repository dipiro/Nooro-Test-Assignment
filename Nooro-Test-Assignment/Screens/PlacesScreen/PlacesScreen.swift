//
//  ContentView.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/8/24.
//

import SwiftUI

struct PlacesScreen<T: PlacesScreenModelProtocol>: View {
    @State private var viewModel: PlacesScreenModelProtocol
    
    // MARK: - Init
    init(_ viewModel: T = PlacesScreenModel()) {
        self._viewModel = State(initialValue: viewModel)
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 32) {
            textField
            
            switch viewModel.state {
            case .noCity:
                Spacer()
                PlacesNoCity()
            case .loaded(let weather):
                cell(for: weather)
                Spacer()
            case .selected(let weather):
                DetailWeather(weather: weather)
            case .failed:
                EmptyView()
            }
            
            Spacer(minLength: 0)
        }
        .padding()
        .task(taskAction)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

// MARK: - Private
private extension PlacesScreen {
    var textField: some View {
        SearchTextField() { type in
            switch type {
            case .search(let cityName):
                Task {
                    await viewModel.fetch(by: cityName)
                }
            }
        }
    }
    
    func cell(for weather: WeatherModel) -> some View {
        PlaceCell(weather: weather) { type in
            switch type {
            case .cellTapped:
                withAnimation {
                    viewModel.selectWeather(weather)
                }
            }
        }
    }
    
    // MARK: - Func
    @Sendable func taskAction() async {
        await viewModel.fetchSelectedCity()
    }
}

// MARK: - Preview
#Preview {
    PlacesScreen()
}
