public protocol AuthRepositoryProtocol: Sendable {
    func signInWithCredentials(email: String, password: String) async throws -> FirebaseUser
    func signInWithGoogle() async throws -> FirebaseUser
    func signOut() async throws
    func getCurrentUser() async -> FirebaseUser?
}
