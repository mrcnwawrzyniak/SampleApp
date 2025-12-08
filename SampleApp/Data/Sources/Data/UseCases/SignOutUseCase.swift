//
//  DefaultSignOutUseCase.swift
//  Data
//
//  Created by Marcin Wawrzyniak on 05/12/2025.
//

import Domain

public final class SignOutUseCase: SignOutUseCaseProtocol {
    private let authRepository: AuthRepositoryProtocol

    public init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }

    public func execute() async throws {
        try await authRepository.signOut()
    }
}
