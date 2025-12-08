import Foundation

public protocol NetworkServiceProtocol: Sendable {
    func request<T: Decodable & Sendable>(_ router: APIRouter) async throws -> T
}
