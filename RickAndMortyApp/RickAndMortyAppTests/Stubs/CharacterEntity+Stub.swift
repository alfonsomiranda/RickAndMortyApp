//
//  CharacterEntity+Stub.swift
//  RickAndMortyAppTests
//
//  Created by Alfonso Miranda on 23/12/22.
//

import Foundation

@testable import RickAndMortyApp

extension CharacterEntity: Stubbable {
    static func stub() -> CharacterEntity {
        return CharacterEntity(id: 1,
                               name: "Test",
                               status: .alive,
                               species: "",
                               type: "",
                               gender: "",
                               origin: LocationEntity.stub(),
                               location: LocationEntity.stub(),
                               image: "",
                               episode: [],
                               url: "",
                               created: "")
    }
}
