//
//  Network.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/8/24.
//

import Foundation

final class Network: Networkable {
    private let session: URLSession

    // MARK: - Init
    init(_ session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - Public
extension Network {
    func fetch<T>(by userEndpoints: UserEndpoints, for type: T.Type) async throws -> T where T : Decodable {
        guard let url = URL(string: userEndpoints.endpoint) else {
            throw AppConstants.Errors.Network.invalidUrl
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
            throw AppConstants.Errors.Network.unexpectedStatusCode
        }
        
        guard let result = try? JSONDecoder().decode(T.self, from: data) else {
            throw AppConstants.Errors.Network.decode
        }
        
        return result
    }
}
