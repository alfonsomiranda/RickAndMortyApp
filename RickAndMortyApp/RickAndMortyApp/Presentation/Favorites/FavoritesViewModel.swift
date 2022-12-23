//
//  FavoritesViewModel.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 23/12/22.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var characters: [Character] = []
    var getFavoritesUseCase: GetFavoritesUseCase?

    init(getFavoritesUseCase: GetFavoritesUseCase) {
        self.getFavoritesUseCase = getFavoritesUseCase
    }

    @MainActor
    func getCharacters() {
        self.characters = self.getFavoritesUseCase?.execute() ?? []
    }
}
