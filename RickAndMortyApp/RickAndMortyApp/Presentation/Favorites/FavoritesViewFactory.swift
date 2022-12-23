//
//  FavoritesViewFactory.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 23/12/22.
//

import SwiftUI

struct FavoritesViewFactory {
    static func view() -> some View {
        FavoritesView(viewModel: viewModel())
    }
}

private extension FavoritesViewFactory {
    static func viewModel() -> FavoritesViewModel {
        FavoritesViewModel(getFavoritesUseCase: GetFavoritesUseCaseImplementation(repository: repository()))
    }

    static func repository() -> FavoriteRepository {
        FavoriteRepositoryImplementation()
    }
}
