//
//  DefaultGoogleSignInUseCase.swift
//  Data
//
//  Created by Marcin Wawrzyniak on 05/12/2025.
//

import Domain

public final class DefaultGoogleSignInUseCase: GoogleSignInUseCaseProtocol {
    private let authRepository: AuthRepositoryProtocol

    public init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }

    public func execute() async throws -> User {
        try await authRepository.signInWithGoogle()
    }
}
