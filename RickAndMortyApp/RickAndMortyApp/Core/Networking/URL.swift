import Foundation

enum Base: String {
    case prod = "https://rickandmortyapi.com/api/"
}

enum Endpoint: String {
    case character = "character"
    case location = "location"
}

struct URLEndpoint {
    static func url(base: Base, endpoint: Endpoint) -> String {
        base.rawValue + endpoint.rawValue
    }
}
