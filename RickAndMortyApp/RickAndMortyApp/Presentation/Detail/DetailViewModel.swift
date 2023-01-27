//
//  DetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 23/12/22.
//

import Foundation

class DetailViewModel: ObservableObject {
    private var addNewFavoriteUseCase: AddNewFavoriteUseCase
    private var getLocationUseCase: GetLocationUseCase
    private var isFavoriteUseCase: IsFavoriteFavoritesUseCase
    private var removeFavoriteUseCase: RemoveFavoriteUseCase
    private var character: Character
    
    @Published var viewInfo: ViewInfo?

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
        let result = await getLocationUseCase.execute(characterId: character.id)
        switch result {
        case .success(let location):
            self.viewInfo = ViewInfo(character: character,
                                     location: location,
                                     isFavorite: isCharacterFavorite())
        case .failure(let error):
            debugPrint(error)
        }
    }

    func isCharacterFavorite() -> Bool {
        isFavoriteUseCase.execute(character: character)
    }

    func updateFavoriteCharacters() {
        if isCharacterFavorite() {
            self.removeFavoriteUseCase.execute(character: character)
        } else {
            self.addNewFavoriteUseCase.execute(character: character)
        }
        self.viewInfo?.isFavorite.toggle()
    }
}

struct ViewInfo {
    let character: Character
    let location: Location
    var isFavorite: Bool
}
