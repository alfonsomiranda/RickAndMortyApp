//
//  CharactersEntity.swift
//  RickAndMortyAppTests
//
//  Created by Alfonso Miranda on 23/12/22.
//

import Foundation
@testable import RickAndMortyApp

extension CharactersEntity: Stubbable {
    static func stub() -> CharactersEntity {
        return CharactersEntity(info: Info(count: 1, pages: 1, next: "", prev: ""),
                                results: [CharacterEntity.stub()])
    }
}
