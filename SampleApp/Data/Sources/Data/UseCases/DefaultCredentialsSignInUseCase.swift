//
//  DefaultLoginUseCase.swift
//  Data
//
//  Created by Marcin Wawrzyniak on 05/12/2025.
//

import Domain

public final class DefaultCredentialsSignInUseCase: CredentialsSignInUseCase {
    private let authRepository: AuthRepository

    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute(email: String, password: String) async throws -> User {
        try await authRepository.signInWithCredentials(email: email, password: password)
    }
}
