//
//  Nooro_Test_AssignmentTests.swift
//  Nooro-Test-AssignmentTests
//
//  Created by piro2 on 12/9/24.
//

import Testing
@testable import Nooro_Test_Assignment

struct Nooro_Test_AssignmentTests {
    let viewModel = PlacesScreenModel()
    
    @Test func loadedTest() async throws {
        await viewModel.fetch(by: "London")
        switch viewModel.state {
        case .loaded(weather: let weather):
            #expect(weather.displayCity == "London")
        default:
            #expect(false)
        }
    }
    
    @Test func failedTest() async throws {
        await viewModel.fetch(by: "1")
        switch viewModel.state {
        case .failed:
            #expect(true)
        default:
            #expect(false)
        }
    }
    
    @Test func selectedCityTest() async throws {
        Defaults.shared.selectedCity = "Minsk"
        await viewModel.fetchSelectedCity()
        switch viewModel.state {
        case .loaded(weather: let weather):
            #expect(weather.displayCity == "Minsk")
        default:
            #expect(false)
        }
    }
}
