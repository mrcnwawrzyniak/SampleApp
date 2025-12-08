public protocol GetCurrentUserUseCaseProtocol: Sendable {
    func execute() async -> User?
}

