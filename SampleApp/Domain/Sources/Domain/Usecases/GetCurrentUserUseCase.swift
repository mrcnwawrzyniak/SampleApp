public protocol GetCurrentUserUseCase: Sendable {
    func execute() async -> User?
}

