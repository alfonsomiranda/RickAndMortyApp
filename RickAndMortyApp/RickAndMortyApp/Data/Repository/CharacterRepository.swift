//
//  CharacterRepository.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 21/12/22.
//

import Foundation

protocol CharacterRepository {
    var api: DataSource { get set }
    func getCharacters(_ page: Int) async throws -> CharactersEntity?
}

class CharacterRepositoryImplementation: CharacterRepository {
    var api: DataSource = APIRest(networking: URLSession.shared)

    func getCharacters(_ page: Int) async throws -> CharactersEntity? {
        do {
            return try await api.request(url: URLEndpoint.url(base: .prod,
                                                              endpoint: .character) + "?page=\(page)",
                                         type: CharactersEntity.self)
        } catch(let error) {
            throw error
        }
    }
}
