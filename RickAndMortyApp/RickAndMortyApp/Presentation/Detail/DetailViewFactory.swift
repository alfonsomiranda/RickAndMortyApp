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
        DetailViewModel(character: character,
                        getLocationUseCase: GetLocationUseCaseImplementation(repository: locationRepository()),
                        addNewFavoriteUseCase: AddNewFavoriteUseCaseImplementation(repository: repository()),
                        removeFavoriteUseCase: RemoveFavoriteUseCaseImplementation(repository: repository()),
                        isFavoriteUseCase: IsFavoriteFavoritesUseCaseImplementation(repository: repository()))
    }

    static func repository() -> FavoriteRepository {
        FavoriteRepositoryImplementation()
    }

    static func locationRepository() -> LocationRepository {
        LocationRepositoryImplementation()
    }
}
