//
//  DataSourceMock.swift
//  RickAndMortyAppTests
//
//  Created by Alfonso Miranda on 23/12/22.
//

import Foundation
@testable import RickAndMortyApp

class DataSourceMock: DataSource {
    var requestCalled: Bool = false

    private struct Dumb: Codable {

    }

    func request<T>(url: String, type: T.Type) async throws -> T? where T : Decodable, T : Encodable {
        // TODO: CREAR UN JSON DE EJEMPLO Y PARSEARLO AQUÍ
        requestCalled = true
        let element =  data(from: "", type: CharactersEntity.self) as? T
        return element
    }
}

extension DataSource {
    func data<T: Codable>(from file: String, type: T.Type) -> T? {
        let decoder = JSONDecoder()
        guard
            let url = Bundle.main.url(forResource: file, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let json = try? decoder.decode(T.self, from: data)
        else {
            return nil
        }
        return json
    }
}
