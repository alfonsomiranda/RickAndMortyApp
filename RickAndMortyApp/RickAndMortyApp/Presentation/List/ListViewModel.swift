//
//  ListViewModel.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 21/12/22.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    var getCharacterUseCase: GetCharactersUseCase?

    init(getCharacterUseCase: GetCharactersUseCase) {
        self.getCharacterUseCase = getCharacterUseCase
    }

    @MainActor
    func getCharacters() async {
        let result = await getCharacterUseCase?.execute()
        switch result {
        case .success(let characters):
            self.characters.append(contentsOf: characters)
        case .failure(let error):
            debugPrint(error)
        default:
            debugPrint("Default")
        }
    }

    func checkCurrentCharacter(character: Character) async {
        if character == characters.last {
            await getCharacters()
        }
    }
}
