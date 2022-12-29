//
//  CharacterCell.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 22/12/22.
//

import SwiftUI

private extension CGFloat {
    static var size: Self { 50 }
}


struct CharacterCell: View {
    var character: Character?

    init(character: Character) {
        self.character = character
    }

    var body: some View {
        VStack {
            HStack {
                AsyncImage(
                    url: URL(string: character?.image ?? "")!,
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

                VStack(alignment: .leading) {
                    Text(character?.name ?? "")
                    Text(character?.species ?? "")
                }
            }
        }
    }
}
