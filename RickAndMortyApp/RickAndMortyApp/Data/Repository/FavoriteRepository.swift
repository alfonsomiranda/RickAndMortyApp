//
//  FavoriteRepository.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 22/12/22.
//

import Foundation

protocol FavoriteRepository {
    func getFavorites() -> [Character]
    func addFavorite(newCharacter: Character)
    func removeFavorite(oldCharacter: Character)
}

class FavoriteRepositoryImplementation: FavoriteRepository {
    @UserDefaultStorage(key: "favorites", defaultValue: [])
    private var favorites: [Character]

    func getFavorites() -> [Character] {
        return favorites
    }

    func addFavorite(newCharacter: Character) {
        favorites.append(newCharacter)
    }

    func removeFavorite(oldCharacter: Character) {
        favorites.removeAll { character in
            oldCharacter == character
        }
    }
}
