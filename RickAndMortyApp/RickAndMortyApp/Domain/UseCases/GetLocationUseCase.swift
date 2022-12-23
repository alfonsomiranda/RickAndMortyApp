//
//  GetLocationUseCase.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 23/12/22.
//

import Foundation

protocol GetLocationUseCase {
    func execute(characterId: Int) async -> Result<Location, UseCaseError>
}

class GetLocationUseCaseImplementation: GetLocationUseCase {
    var repository: LocationRepository?

    init(repository: LocationRepository) {
        self.repository = repository
    }

    func execute(characterId: Int) async -> Result<Location, UseCaseError> {
        do {
            if let locationEntity = try await repository?.getLocation(characterId) {
                return .success(Location(entity: locationEntity))
            } else {
                return .failure(.decodingError)
            }
        } catch(let error) {
            switch error {
            case APIError.badResponse:
                return .failure(.networkError)
            default:
                return .failure(.decodingError)
            }
        }
    }
}
