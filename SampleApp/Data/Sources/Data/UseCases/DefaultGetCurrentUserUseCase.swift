//
//  DefaultGetCurrentUserUseCase.swift
//  Data
//
//  Created by Marcin Wawrzyniak on 05/12/2025.
//

import Domain

public final class DefaultGetCurrentUserUseCase: GetCurrentUserUseCase {
    private let authRepository: AuthRepository

    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute() async -> User? {
        await authRepository.getCurrentUser()
    }
}
