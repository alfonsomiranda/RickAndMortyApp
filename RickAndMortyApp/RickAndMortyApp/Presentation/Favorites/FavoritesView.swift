//
//  FavoritesView.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 23/12/22.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: FavoritesViewModel

    var body: some View {
        List {
            ForEach(viewModel.characters) { character in
                NavigationLink(destination: DetailViewFactory.view(character: character)) {
                    CharacterCell(character: character)
                }
                .navigationTitle("Favorites")
            }
        }
        .onAppear {
            viewModel.getCharacters()
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesViewFactory.view()
    }
}
