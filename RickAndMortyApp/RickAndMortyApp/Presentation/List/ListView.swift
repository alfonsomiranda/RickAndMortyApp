//
//  ListView.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 21/12/22.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characters) { character in
                    NavigationLink(destination: DetailViewFactory.view(character: character)) {
                        CharacterCell(character: character)
                    }
                    .navigationTitle("Rick and Morty")
                    .task {
                        await viewModel.checkCurrentCharacter(character: character)
                    }
                }
            }
            .toolbar {
                NavigationLink("Favorites") {
                    FavoritesViewFactory.view()
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.getCharacters()
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListViewFactory.view()
    }
}
