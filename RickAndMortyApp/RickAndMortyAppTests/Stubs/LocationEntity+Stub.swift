//
//  LocationEntity+Stub.swift
//  RickAndMortyAppTests
//
//  Created by Alfonso Miranda on 23/12/22.
//

import Foundation

@testable import RickAndMortyApp

extension LocationEntity: Stubbable {
    static func stub() -> LocationEntity {
        return LocationEntity(id: 1, name: "", type: "", dimension: "", residents: [], url: "", created: "")
    }
}
