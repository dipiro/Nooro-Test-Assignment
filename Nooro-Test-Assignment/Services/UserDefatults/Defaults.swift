//
//  Defaults.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/9/24.
//

import SwiftUI

final class Defaults: ObservableObject {
    public static let shared = Defaults()
    
    @AppStorage("selectedCity")
    var selectedCity: String = ""
}
