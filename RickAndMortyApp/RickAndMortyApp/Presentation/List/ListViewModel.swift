//
//  ListViewModel.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 21/12/22.
//

import Foundation

enum ViewState: Equatable {
    case success(characters: [Character])
    case loading
    case error
}

class ListViewModel: ObservableObject {
    @Published var viewState: ViewState = .loading
    private var characters: [Character] = []
    private var getCharacterUseCase: GetCharactersUseCase

    init(getCharacterUseCase: GetCharactersUseCase) {
        self.getCharacterUseCase = getCharacterUseCase
    }

    @MainActor
    func getCharacters() async {
        let result = await getCharacterUseCase.execute()
        switch result {
        case .success(let characters):
            self.characters.append(contentsOf: characters)
            viewState = .success(characters: self.characters)
        case .failure(_):
            viewState = .error
        }
    }

    func checkCurrentCharacter(character: Character) async {
        if character == characters.last {
            await getCharacters()
        }
    }
}
