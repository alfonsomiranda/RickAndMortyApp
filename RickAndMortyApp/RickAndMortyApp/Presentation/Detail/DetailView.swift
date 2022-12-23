//
//  DetailView.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 21/12/22.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel

    var body: some View {
        VStack {
            if let character = viewModel.character {
                CharacterCell(character: character)
            }
            Text(viewModel.location?.name ?? "")
            Button("Favorito") {
                viewModel.saveCharacters()
            }
            Spacer()
        }
        .navigationTitle(viewModel.character?.name ?? "")
        .onAppear {
            Task {
                await viewModel.getLocationDetail()
            }
        }
    }
}
