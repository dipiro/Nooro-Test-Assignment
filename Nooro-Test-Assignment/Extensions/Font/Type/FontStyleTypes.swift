//
//  FontStyleTypes.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/9/24.
//

import SwiftUI

enum FontStyleTypes {
    case title70Bold
    case title60Bold
    case title30Bold
    
    case subtitle20Bold
    
    case body15Bold
    
    case footnote12RegularGrayMiddle
    case footnote15MediumGray
    
    // MARK: -
    var config: FontConfig {
        switch self {
        case .title70Bold:
                .init(design: .default, weight: .bold, size: 70, color: .black, customFontName: "Poppins-Bold")
        case .title60Bold:
                .init(design: .default, weight: .bold, size: 60, color: .black, customFontName: "Poppins-Bold")
        case .title30Bold:
                .init(design: .default, weight: .bold, size: 30, color: .black, customFontName: "Poppins-Bold")
            
        case .subtitle20Bold:
                .init(design: .default, weight: .bold, size: 20, color: .black, customFontName: "Poppins-Bold")
            
        case .body15Bold:
                .init(design: .default, weight: .bold, size: 15, color: .black, customFontName: "Poppins-Bold")
            
        case .footnote12RegularGrayMiddle:
                .init(design: .default, weight: .regular, size: 12, color: .grayMiddle, customFontName: "Poppins-Regular")
        case .footnote15MediumGray:
                .init(design: .default, weight: .medium, size: 15, color: .gray, customFontName: "Poppins-Medium")
        }
    }
}
