import Foundation

enum Base: String {
    case prod = "https://api.themoviedb.org/3"
}

enum Endpoint: String {
    case popular = "/movie/popular"
}

struct URLEndpoint {
    static func url(base: Base, endpoint: Endpoint) -> String {
        guard let apiKey  = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { return "" }
        return base.rawValue + endpoint.rawValue  + "?api_key=" + apiKey
    }
}
