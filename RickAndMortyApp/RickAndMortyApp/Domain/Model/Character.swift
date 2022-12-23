//
//  Character.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 21/12/22.
//

import Foundation

struct Character: Identifiable, Codable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String

    init(entity: CharacterEntity) {
        self.id = entity.id
        self.name = entity.name
        self.status = entity.status
        self.species = entity.species
        self.type = entity.type
        self.gender = entity.gender
        self.origin = entity.origin
        self.location = entity.location
        self.image = entity.image
        self.episode = entity.episode
        self.url = entity.url
        self.created = entity.created
    }
}

extension Character: Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.id == rhs.id
    }
}
