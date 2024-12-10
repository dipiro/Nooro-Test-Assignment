//
//  Networkable.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/8/24.
//

import Foundation

protocol Networkable {
    func fetch<T>(by userEndpoints: UserEndpoints, for type: T.Type) async throws -> T where T: Decodable
}
