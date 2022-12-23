//
//  CharacterRepository.swift
//  RickAndMortyAppTests
//
//  Created by Alfonso Miranda on 23/12/22.
//

import XCTest
@testable import RickAndMortyApp

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

    func testGetTopMoviesWhenSuccess() async throws {
        do {
            networking.result = try .success(JSONEncoder().encode(characters))
            networking.response = HTTPURLResponse(url: URL(string: "http://google.com")!,
                                                  statusCode: 200,
                                                  httpVersion: "",
                                                  headerFields: nil)!
            repository.api = APIRest(networking: networking)
            let newCharacters = try await repository.getCharacters(1)
            XCTAssertEqual(characters.results.first?.name, newCharacters?.results.first?.name)
        } catch(let error) {
            XCTFail(error.localizedDescription)
        }
    }

    func testGetTopMoviesWhenErrorCode() async throws {
        do {
            networking.result = try .success(JSONEncoder().encode(characters))
            networking.response = HTTPURLResponse(url: URL(string: "http://google.com")!,
                                                  statusCode: 400,
                                                  httpVersion: "",
                                                  headerFields: nil)!
            repository.api = APIRest(networking: networking)
            let newCharacters = try await repository.getCharacters(1)
            XCTAssertNil(newCharacters)
        } catch(let error) {
            XCTAssertEqual((error as? APIError), .httpError(error: 400))
        }
    }

    func testGetTopMoviesWhenFail() async throws {
        do {
            networking.result = .failure(APIError.generic)
            networking.response = HTTPURLResponse(url: URL(string: "http://google.com")!,
                                                  statusCode: 200,
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
