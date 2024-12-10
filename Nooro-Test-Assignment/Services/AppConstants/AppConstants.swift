//
//  AppConstans.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/8/24.
//

import Foundation
import SwiftUI

enum AppConstants {
    
}

// MARK: - Keys
extension AppConstants {
    enum Keys {
        static let weatherAPIKey = "a202fcec75f241749bd200000240812"
    }
}

// MARK: - Endpoints
extension AppConstants {
    enum Endpoints {
        static let weatherAPISearch = "https://api.weatherapi.com/v1/current.json?key=%@&q=%@&aqi=yes"
        
        static func getWeatherAPISearch(city: String, key: String = AppConstants.Keys.weatherAPIKey) -> String {
            String(format: weatherAPISearch, key, city)
        }
    }
}

// MARK: - Images
extension AppConstants {
    enum Icon {
        case search, photo, location
        
        var image: Image {
            switch self {
            case .search:
                Image(systemName: "magnifyingglass")
            case .photo:
                Image(systemName: "photo.artframe")
            case .location:
                Image(systemName: "location.fill")
            }
        }
    }
}

// MARK: - Errors
extension AppConstants {
    enum Errors {
        enum Network: Error {
            case invalidUrl
            case unexpectedStatusCode
            case decode
            case unknown
        }
    }
}
