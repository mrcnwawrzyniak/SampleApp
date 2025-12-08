import Foundation
import Domain
import Core

public final class UserRepository: UserRepositoryProtocol {
    private let networkService: NetworkServiceProtocol

    public init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    public func fetchUsers() async throws -> [ApiUser] {
        return try await networkService.request(.getUsers)
    }

    public func fetchUser(id: Int) async throws -> ApiUser {
        return try await networkService.request(.getUser(id: id))
    }
}
