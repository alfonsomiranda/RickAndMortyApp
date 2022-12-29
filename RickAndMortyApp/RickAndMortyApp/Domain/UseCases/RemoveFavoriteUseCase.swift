//
//  RemoveFavoriteUseCase.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 29/12/22.
//

import Foundation

protocol RemoveFavoriteUseCase {
    func execute(character: Character)
}

class RemoveFavoriteUseCaseImplementation: RemoveFavoriteUseCase {
    var repository: FavoriteRepository?

    init(repository: FavoriteRepository) {
        self.repository = repository
    }

    func execute(character: Character) {
        repository?.removeFavorite(oldCharacter: character)
    }
}
