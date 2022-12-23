//
//  LocationEntity.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 23/12/22.
//

import Foundation

// MARK: - LocationEntity
struct LocationEntity: Codable {
    let id: Int?
    let name, type, dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}
