//
//  DetailViewFactory.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 23/12/22.
//

import SwiftUI

struct DetailViewFactory {
    static func view(character: Character) -> some View {
        DetailView(viewModel: viewModel(character: character))
    }
}

private extension DetailViewFactory {
    static func viewModel(character: Character) -> DetailViewModel {
        DetailViewModel(character: character, addNewFavoriteUseCase: AddNewFavoriteUseCaseImplementation(repository: repository()))
    }

    static func repository() -> FavoriteRepository {
        FavoriteRepositoryImplementation()
    }
}
