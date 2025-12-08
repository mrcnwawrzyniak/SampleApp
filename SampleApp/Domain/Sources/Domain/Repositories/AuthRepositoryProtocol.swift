public protocol AuthRepositoryProtocol: Sendable {
    func signInWithCredentials(email: String, password: String) async throws -> User
    func signInWithGoogle() async throws -> User
    func signOut() async throws
    func getCurrentUser() async -> User?
}
