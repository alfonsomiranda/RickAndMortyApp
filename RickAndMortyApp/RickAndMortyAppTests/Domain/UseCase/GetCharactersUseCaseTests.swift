//
//  GetCharactersUseCaseTests.swift
//  RickAndMortyAppTests
//
//  Created by Alfonso Miranda on 23/12/22.
//

import XCTest
@testable import RickAndMortyApp

final class GetCharactersUseCaseTests: XCTestCase {
    private var useCase: GetCharactersUseCase!
    private let repository = CharacterRepositoryMock()

    override func setUpWithError() throws {
        useCase = GetCharactersUseCaseImplementation(repository: repository)
    }

    override func tearDownWithError() throws {
        useCase = nil
    }

    func testExecuteSuccess() async throws {
        repository.entity = CharactersEntity.stub()
        let result = await useCase.execute()
        XCTAssertTrue(repository.getCharactersIsCalled)
        switch result {
        case .success(let success):
            XCTAssertNotNil(success)
        case .failure(let failure):
            XCTFail(failure.localizedDescription)
        }
    }

    func testExecuteFail() async throws {
        repository.entity = nil
        let result = await useCase.execute()
        XCTAssertTrue(repository.getCharactersIsCalled)
        switch result {
        case .success(let success):
            XCTAssertNil(success)
        case .failure(let failure):
            XCTAssertNotNil(failure)
        }
    }
}
