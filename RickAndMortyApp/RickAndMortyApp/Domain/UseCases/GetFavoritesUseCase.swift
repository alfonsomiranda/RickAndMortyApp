//
//  GetFavoritesUseCase.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 22/12/22.
//

import Foundation

protocol GetFavoritesUseCase {
    func execute() -> [Character]
}

class GetFavoritesUseCaseImplementation: GetFavoritesUseCase {
    var repository: FavoriteRepository?

    init(repository: FavoriteRepository) {
        self.repository = repository
    }

    func execute() -> [Character] {
        repository?.getFavorites() ?? []
    }
}
