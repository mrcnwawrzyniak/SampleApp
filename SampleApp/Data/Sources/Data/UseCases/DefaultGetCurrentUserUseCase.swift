//
//  DefaultGetCurrentUserUseCase.swift
//  Data
//
//  Created by Marcin Wawrzyniak on 05/12/2025.
//

import Domain

public final class DefaultGetCurrentUserUseCase: GetCurrentUserUseCaseProtocol {
    private let authRepository: AuthRepositoryProtocol

    public init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }

    public func execute() async -> User? {
        await authRepository.getCurrentUser()
    }
}
