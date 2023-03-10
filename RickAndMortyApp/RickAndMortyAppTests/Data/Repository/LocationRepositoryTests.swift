//
//  LocationRepositoryTests.swift
//  RickAndMortyAppTests
//
//  Created by Alfonso Miranda on 28/12/22.
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

class LocationRepositoryTests: XCTestCase {
    private var networking: NetworkingMock!
    private var repository: LocationRepository!
    private var location: LocationEntity!
    private var api: DataSource!

    override func setUpWithError() throws {
        networking = NetworkingMock()
        repository = LocationRepositoryImplementation()
        api = APIRest(networking: networking)
        repository.api = api

        location = LocationEntity.stub()
    }

    override func tearDownWithError() throws {
        networking = nil
        repository = nil
        api = nil
        location = nil
    }

    func testGetLocationWhenSuccess() async throws {
        do {
            networking.result = try .success(JSONEncoder().encode(location))
            networking.response = HTTPURLResponse(url: .defaultURL,
                                                  statusCode: .okHttpCode,
                                                  httpVersion: "",
                                                  headerFields: nil)!
            repository.api = APIRest(networking: networking)
            let newLocation = try await repository.getLocation(1)
            XCTAssertEqual(location.id, newLocation?.id)
        } catch(let error) {
            XCTFail(error.localizedDescription)
        }
    }

    func testGetLocationWhenErrorCode() async throws {
        do {
            networking.result = try .success(JSONEncoder().encode(location))
            networking.response = HTTPURLResponse(url: .defaultURL,
                                                  statusCode: .koHttpCode,
                                                  httpVersion: "",
                                                  headerFields: nil)!
            repository.api = APIRest(networking: networking)
            let newLocation = try await repository.getLocation(1)
            XCTAssertNil(newLocation)
        } catch(let error) {
            XCTAssertEqual((error as? APIError), .httpError(error: .koHttpCode))
        }
    }

    func testGetLocationWhenFail() async throws {
        do {
            networking.result = .failure(APIError.generic)
            networking.response = HTTPURLResponse(url: .defaultURL,
                                                  statusCode: .okHttpCode,
                                                  httpVersion: "",
                                                  headerFields: nil)!
            repository.api = APIRest(networking: networking)
            let newLocation = try await repository.getLocation(1)
            XCTAssertNil(newLocation)
        } catch(let error) {
            XCTAssertEqual(error as? APIError, APIError.generic)
        }
    }
}

