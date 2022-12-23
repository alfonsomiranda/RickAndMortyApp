//
//  GetCharactersUseCase.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 21/12/22.
//

import Foundation

protocol GetCharactersUseCase {
    func execute() async -> Result<[Character], UseCaseError>
}

class GetCharactersUseCaseImplementation: GetCharactersUseCase {
    var repository: CharacterRepository?

    private var page = 1

    init(repository: CharacterRepository) {
        self.repository = repository
    }

    func execute() async -> Result<[Character], UseCaseError> {
        do {
            let charactersEntity = try await repository?.getCharacters(page)
            var characters: [Character] = []
            if let charactersEntity = charactersEntity?.results {
                characters = charactersEntity.map { Character(entity: $0) }
                page += 1
            }
            return .success(characters)
        } catch(let error) {
            switch error {
            case APIError.badResponse:
                return .failure(.networkError)
            default:
                return .failure(.decodingError)
            }
        }
    }
}
