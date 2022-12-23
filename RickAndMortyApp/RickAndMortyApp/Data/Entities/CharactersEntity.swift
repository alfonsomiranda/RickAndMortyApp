//
//  CharactersEntity.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 21/12/22.
//

import Foundation

// MARK: - CharactersEntity
struct CharactersEntity: Codable {
    let info: Info
    let results: [CharacterEntity]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}

// MARK: - Result
struct CharacterEntity: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let type: String
    let gender: String
    let origin, location: LocationEntity
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
