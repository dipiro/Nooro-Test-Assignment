//
//  UserEndpoints.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/8/24.
//

import Foundation

enum UserEndpoints {
    case search(city: String)
    
    var endpoint: String {
        switch self {
        case .search(let city):
            AppConstants.Endpoints.getWeatherAPISearch(city: city)
        }
    }
}
