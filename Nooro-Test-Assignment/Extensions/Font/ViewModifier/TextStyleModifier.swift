//
//  TextStyleModifier.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/9/24.
//

import SwiftUI

struct TextStyleModifier: ViewModifier {
    let config: FontConfig
    
    func body(content: Content) -> some View {
        if let customFontName = config.customFontName {
            content
                .font(.custom(customFontName, size: config.size))
                .foregroundColor(config.color)
        } else {
            content
                .font(.system(size: config.size, weight: config.weight, design: config.design))
                .foregroundColor(config.color)
        }
    }
}

extension View {
    func fontStyle(_ style: FontStyleTypes) -> some View {
        self.modifier(TextStyleModifier(config: style.config))
    }
}
