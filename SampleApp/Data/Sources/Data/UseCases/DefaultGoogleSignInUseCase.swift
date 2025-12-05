//
//  DefaultGoogleSignInUseCase.swift
//  Data
//
//  Created by Marcin Wawrzyniak on 05/12/2025.
//

import Domain

public final class DefaultGoogleSignInUseCase: GoogleSignInUseCase {
    private let authRepository: AuthRepository

    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute() async throws -> User {
        try await authRepository.signInWithGoogle()
    }
}
