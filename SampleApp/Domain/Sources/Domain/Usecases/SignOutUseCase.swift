public protocol SignOutUseCase: Sendable {
    func execute() async throws
}

