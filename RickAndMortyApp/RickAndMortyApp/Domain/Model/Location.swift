//
//  Location.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 23/12/22.
//

import Foundation

struct Location: Identifiable, Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String

    init(entity: LocationEntity) {
        self.id = entity.id ?? 0
        self.name = entity.name ?? ""
        self.type = entity.type ?? ""
        self.dimension = entity.dimension ?? ""
        self.residents = entity.residents ?? []
        self.url = entity.url ?? ""
        self.created = entity.created ?? ""
    }
}
