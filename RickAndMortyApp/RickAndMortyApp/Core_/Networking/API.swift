import Foundation

enum APIError: Error, Equatable {
    case invalidUrl
    case generic
    case badResponse
    case httpError(error: Int)
}

protocol DataSource {
    func request<T: Codable>(url: String, type: T.Type) async throws -> T?
}

struct APIRest: DataSource {
    private let networking: Networking

    init(networking: Networking = URLSession.shared) {
        self.networking = networking
    }

    func request<T: Codable>(url: String, type: T.Type) async throws -> T? {
        guard let url = URL(string: url) else { throw APIError.invalidUrl }
        let (data, response) = try await networking.data(from: url)

        let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 500
        switch statusCode {
        case 0...299:
            return try JSONDecoder().decode(T.self, from: data)
        default:
            throw APIError.httpError(error: statusCode)
        }
    }
}
