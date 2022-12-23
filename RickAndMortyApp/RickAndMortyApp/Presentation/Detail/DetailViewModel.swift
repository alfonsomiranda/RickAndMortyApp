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
    var character: Character?
    
    @Published var location: Location? = nil

    init(character: Character, getLocationUseCase: GetLocationUseCase, addNewFavoriteUseCase: AddNewFavoriteUseCase) {
        self.character = character
        self.getLocationUseCase = getLocationUseCase
        self.addNewFavoriteUseCase = addNewFavoriteUseCase
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

    func saveCharacters() {
        if let character = character {
            self.addNewFavoriteUseCase?.execute(character: character)
        }
    }
}
