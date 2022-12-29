//
//  IsFavoriteUseCase.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 29/12/22.
//

import Foundation

protocol IsFavoriteFavoritesUseCase {
    func execute(character: Character) -> Bool 
}

class IsFavoriteFavoritesUseCaseImplementation: IsFavoriteFavoritesUseCase {
    var repository: FavoriteRepository?

    init(repository: FavoriteRepository) {
        self.repository = repository
    }

    func execute(character: Character) -> Bool {
        let favorites = repository?.getFavorites() ?? []
        return favorites.contains(character)
    }
}
