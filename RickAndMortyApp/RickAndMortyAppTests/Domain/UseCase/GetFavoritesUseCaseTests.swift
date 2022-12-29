//
//  GetFavoritesUseCaseTests.swift
//  RickAndMortyAppTests
//
//  Created by Alfonso Miranda on 29/12/22.
//

import XCTest
@testable import RickAndMortyApp

final class GetFavoritesUseCaseTests: XCTestCase {
    private var useCase: GetFavoritesUseCase!
    private let repository = FavoriteRepositoryMock()

    override func setUpWithError() throws {
        useCase = GetFavoritesUseCaseImplementation(repository: repository)
    }

    override func tearDownWithError() throws {
        useCase = nil
    }

    func testExecuteSuccess() {
        _ = useCase.execute()
        XCTAssertTrue(repository.getFavoritesCalled)
    }
}

