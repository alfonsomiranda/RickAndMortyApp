//
//  AddNewFavoriteUseCase.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 22/12/22.
//

import Foundation

protocol AddNewFavoriteUseCase {
    func execute(character: Character)
}

class AddNewFavoriteUseCaseImplementation: AddNewFavoriteUseCase {
    var repository: FavoriteRepository?

    init(repository: FavoriteRepository) {
        self.repository = repository
    }

    func execute(character: Character) {
        repository?.addFavorite(newCharacter: character)
    }
}
