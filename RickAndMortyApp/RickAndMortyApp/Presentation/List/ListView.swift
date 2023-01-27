//
//  ListView.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 21/12/22.
//

import SwiftUI

private extension LocalizedStringKey {
    static var title: Self { "APP_TITLE" }
    static var favorites: Self { "FAVORITES_TITLE" }
}

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel

    var body: some View {
        ZStack {
            switch viewModel.viewState {
            case .success(let characters):
                CharactersListView(characters: characters, viewModel: viewModel)
            case .error:
                ErrorView()
            case .loading:
                LoaderView()
            }
        }
        .onAppear {
            Task {
                await viewModel.getCharacters()
            }
        }
    }
}

struct CharactersListView: View {
    private var characters: [Character]
    private var viewModel: ListViewModel
    
    init(characters: [Character], viewModel: ListViewModel) {
        self.characters = characters
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(characters) { character in
                    NavigationLink(destination: DetailViewFactory.view(character: character)) {
                        CharacterCell(character: character)
                    }
                    .navigationTitle(.title)
                    .task {
                        await viewModel.checkCurrentCharacter(character: character)
                    }
                }
            }
            .toolbar {
                NavigationLink(.favorites) {
                    FavoritesViewFactory.view()
                }
            }
        }
    }
}

struct LoaderView: View {
    var body: some View {
        VStack {
            ProgressView()
        }
    }
}

struct ErrorView: View {
    var body: some View {
        Text("Error")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListViewFactory.view()
    }
}
