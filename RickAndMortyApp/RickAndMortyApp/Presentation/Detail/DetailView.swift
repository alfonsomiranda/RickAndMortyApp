//
//  DetailView.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 21/12/22.
//

import SwiftUI

private extension CGFloat {
    static var size: Self { 250 }
}

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel

    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: viewModel.character?.image ?? "")!,
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

            Text(viewModel.location?.name ?? "")
            Text(viewModel.location?.type ?? "")
            Text(viewModel.location?.dimension ?? "")
            let favoriteTitle = (viewModel.isFavorite) ? "Remove favorite" : "Add favorite"
            Button(favoriteTitle) {
                viewModel.updateFavoriteCharacters()
            }
            Spacer()
        }
        .navigationTitle(viewModel.character?.name ?? "")
        .onAppear {
            viewModel.isCharacterFavorite()
            Task {
                await viewModel.getLocationDetail()
            }
        }
    }
}
