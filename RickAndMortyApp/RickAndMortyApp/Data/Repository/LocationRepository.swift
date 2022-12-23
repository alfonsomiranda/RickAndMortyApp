//
//  LocationRepository.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 23/12/22.
//

import Foundation

protocol LocationRepository {
    var api: DataSource { get set }
    func getLocation(_ characterId: Int) async throws -> LocationEntity?
}

class LocationRepositoryImplementation: LocationRepository {
    var api: DataSource = APIRest(networking: URLSession.shared)

    func getLocation(_ characterId: Int) async throws -> LocationEntity? {
        do {
            return try await api.request(url: URLEndpoint.url(base: .prod,
                                                              endpoint: .location) + "/\(characterId)",
                                         type: LocationEntity.self)
        } catch(let error) {
            throw error
        }
    }
}
