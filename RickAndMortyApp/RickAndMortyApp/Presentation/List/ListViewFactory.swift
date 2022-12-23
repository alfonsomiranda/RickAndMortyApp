//
//  ListViewFactory.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 21/12/22.
//

import SwiftUI

struct ListViewFactory {
    static func view() -> some View {
        ListView(viewModel: viewModel())
    }
}

private extension ListViewFactory {
    static func viewModel() -> ListViewModel {
        ListViewModel(getCharacterUseCase: GetCharactersUseCaseImplementation(repository: repository()))
    }

    static func repository() -> CharacterRepository {
        CharacterRepositoryImplementation()
    }
}
