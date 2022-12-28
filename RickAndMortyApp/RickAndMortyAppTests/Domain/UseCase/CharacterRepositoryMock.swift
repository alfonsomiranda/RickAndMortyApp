//
//  CharacterRepositoryMock.swift
//  RickAndMortyAppTests
//
//  Created by Alfonso Miranda on 23/12/22.
//

import Foundation
@testable import RickAndMortyApp

class CharacterRepositoryMock: CharacterRepository {
    var api: DataSource = APIRest(networking: URLSession.shared)
    var entity: CharactersEntity?
    var getCharactersIsCalled = false

    func getCharacters(_ page: Int) async throws -> CharactersEntity? {
        getCharactersIsCalled = true
        guard let entity = entity else { throw APIError.badResponse }
        return entity
    }
}
