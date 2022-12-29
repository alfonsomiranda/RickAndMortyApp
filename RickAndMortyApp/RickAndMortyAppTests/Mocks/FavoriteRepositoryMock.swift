//
//  FavoriteRepositoryMock.swift
//  RickAndMortyAppTests
//
//  Created by Alfonso Miranda on 29/12/22.
//

import Foundation
@testable import RickAndMortyApp

class FavoriteRepositoryMock: FavoriteRepository {
    var getFavoritesCalled = false
    var addFavoriteCalled = false
    var removeFavoriteCalled = false

    func getFavorites() -> [Character] {
        getFavoritesCalled = true
        return []
    }

    func addFavorite(newCharacter: Character) {
        addFavoriteCalled = true
    }

    func removeFavorite(oldCharacter: Character) {
        removeFavoriteCalled = true
    }


}
