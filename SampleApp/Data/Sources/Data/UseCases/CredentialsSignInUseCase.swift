//
//  DefaultLoginUseCase.swift
//  Data
//
//  Created by Marcin Wawrzyniak on 05/12/2025.
//

import Domain

public final class CredentialsSignInUseCase: CredentialsSignInUseCaseProtocol {
    private let authRepository: AuthRepositoryProtocol

    public init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }

    public func execute(email: String, password: String) async throws -> FirebaseUser {
        try await authRepository.signInWithCredentials(email: email, password: password)
    }
}
