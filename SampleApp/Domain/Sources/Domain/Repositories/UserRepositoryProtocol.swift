import Foundation

public protocol UserRepositoryProtocol {
    func fetchUsers() async throws -> [ApiUser]
    func fetchUser(id: Int) async throws -> ApiUser
}
