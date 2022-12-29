//
//  DetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 23/12/22.
//

import Foundation

class DetailViewModel: ObservableObject {
    var addNewFavoriteUseCase: AddNewFavoriteUseCase?
    var getLocationUseCase: GetLocationUseCase?
    var isFavoriteUseCase: IsFavoriteFavoritesUseCase?
    var removeFavoriteUseCase: RemoveFavoriteUseCase?
    var character: Character?
    
    @Published var location: Location? = nil
    @Published var isFavorite: Bool = false

    init(character: Character,
         getLocationUseCase: GetLocationUseCase,
         addNewFavoriteUseCase: AddNewFavoriteUseCase,
         removeFavoriteUseCase: RemoveFavoriteUseCase,
         isFavoriteUseCase: IsFavoriteFavoritesUseCase) {
        self.character = character
        self.getLocationUseCase = getLocationUseCase
        self.addNewFavoriteUseCase = addNewFavoriteUseCase
        self.removeFavoriteUseCase = removeFavoriteUseCase
        self.isFavoriteUseCase = isFavoriteUseCase
    }

    @MainActor
    func getLocationDetail() async {
        guard let character = character else { return }

        let result = await getLocationUseCase?.execute(characterId: character.id)
        switch result {
        case .success(let location):
            self.location = location
        case .failure(let error):
            debugPrint(error)
        default:
            debugPrint("Default")
        }
    }

    func isCharacterFavorite() {
        if let character = character {
            isFavorite = isFavoriteUseCase?.execute(character: character) ?? false
        }
    }

    func updateFavoriteCharacters() {
        if let character = character {
            if isFavorite {
                self.removeFavoriteUseCase?.execute(character: character)
            } else {
                self.addNewFavoriteUseCase?.execute(character: character)
            }
        }
        isCharacterFavorite()
    }
}
