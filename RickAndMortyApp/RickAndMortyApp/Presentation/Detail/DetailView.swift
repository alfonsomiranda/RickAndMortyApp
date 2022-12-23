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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button("Favorito") {
            viewModel.saveCharacters()
        }
    }
}
