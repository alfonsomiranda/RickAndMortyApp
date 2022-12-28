//
//  NetworkingMock.swift
//  RickAndMortyAppTests
//
//  Created by Alfonso Miranda on 23/12/22.
//

import Foundation
@testable import RickAndMortyApp

class NetworkingMock: Networking {
    var result = Result<Data, Error>.success(Data())
    var response: URLResponse = URLResponse()

    func data(
        from url: URL,
        delegate: URLSessionTaskDelegate?
    ) async throws -> (Data, URLResponse) {
        try (result.get(), response)
    }
}
