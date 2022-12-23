//
//  DetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 23/12/22.
//

import Foundation

class DetailViewModel: ObservableObject {
    var addNewFavoriteUseCase: AddNewFavoriteUseCase?
    var character: Character?

    init(character: Character, addNewFavoriteUseCase: AddNewFavoriteUseCase) {
        self.character = character
        self.addNewFavoriteUseCase = addNewFavoriteUseCase
    }

    @MainActor
    func saveCharacters() {
        if let character = character {
            self.addNewFavoriteUseCase?.execute(character: character)
        }
    }
}
