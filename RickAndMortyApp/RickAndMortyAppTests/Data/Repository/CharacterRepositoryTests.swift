//
//  CharacterRepository.swift
//  RickAndMortyAppTests
//
//  Created by Alfonso Miranda on 23/12/22.
//

import XCTest
@testable import RickAndMortyApp

private extension URL {
    static var defaultURL: Self { URL(string: "http://google.com")! }
}

private extension Int {
    static var okHttpCode: Self { 200 }
    static var koHttpCode: Self { 400 }
}

class CharacterRepositoryTests: XCTestCase {
    private var networking: NetworkingMock!
    private var repository: CharacterRepository!
    private var characters: CharactersEntity!
    private var api: DataSource!

    override func setUpWithError() throws {
        networking = NetworkingMock()
        repository = CharacterRepositoryImplementation()
        api = APIRest(networking: networking)
        repository.api = api

        characters = CharactersEntity.stub()
    }

    override func tearDownWithError() throws {
        networking = nil
        repository = nil
        api = nil
        characters = nil
    }

    func testGetCharactersWhenSuccess() async throws {
        do {
            networking.result = try .success(JSONEncoder().encode(characters))
            networking.response = HTTPURLResponse(url: .defaultURL,
                                                  statusCode: .okHttpCode,
                                                  httpVersion: "",
                                                  headerFields: nil)!
            repository.api = APIRest(networking: networking)
            let newCharacters = try await repository.getCharacters(1)
            XCTAssertEqual(characters.results.first?.name, newCharacters?.results.first?.name)
        } catch(let error) {
            XCTFail(error.localizedDescription)
        }
    }

    func testGetCharactersWhenErrorCode() async throws {
        do {
            networking.result = try .success(JSONEncoder().encode(characters))
            networking.response = HTTPURLResponse(url: .defaultURL,
                                                  statusCode: .koHttpCode,
                                                  httpVersion: "",
                                                  headerFields: nil)!
            repository.api = APIRest(networking: networking)
            let newCharacters = try await repository.getCharacters(1)
            XCTAssertNil(newCharacters)
        } catch(let error) {
            XCTAssertEqual((error as? APIError), .httpError(error: .koHttpCode))
        }
    }

    func testGetCharactersWhenFail() async throws {
        do {
            networking.result = .failure(APIError.generic)
            networking.response = HTTPURLResponse(url: .defaultURL,
                                                  statusCode: .okHttpCode,
                                                  httpVersion: "",
                                                  headerFields: nil)!
            repository.api = APIRest(networking: networking)
            let newCharacters = try await repository.getCharacters(1)
            XCTAssertNil(newCharacters)
        } catch(let error) {
            XCTAssertEqual(error as? APIError, APIError.generic)
        }
    }
}
