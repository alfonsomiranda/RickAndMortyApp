//
//  DetailView.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 21/12/22.
//

import SwiftUI

private extension LocalizedStringKey {
    static var removeFavorites: Self { "REMOVE_FAVORITE" }
    static var addFavorites: Self { "ADD_FAVORITE" }
}

private extension CGFloat {
    static var size: Self { 250 }
}

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel

    var body: some View {
        VStack {
            if let url = URL(string: viewModel.viewInfo?.character.image ?? "") {
                AsyncImage(
                    url: url,
                    content: { image in
                        image.resizable()
                    },
                    placeholder: {
                        Image("placeholder").resizable()
                    }
                )
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .size, maxHeight: .size)
                .cornerRadius(10)
            }

            Text(viewModel.viewInfo?.location.name ?? "")
            Text(viewModel.viewInfo?.location.type ?? "")
            Text(viewModel.viewInfo?.location.dimension ?? "")
            let favoriteTitle: LocalizedStringKey = (viewModel.viewInfo?.isFavorite ?? false) ? .removeFavorites : .addFavorites
            Button(favoriteTitle) {
                viewModel.updateFavoriteCharacters()
            }
            Spacer()
        }
        .navigationTitle(viewModel.viewInfo?.character.name ?? "")
        .onAppear {
            Task {
                await viewModel.getLocationDetail()
            }
        }
    }
}
