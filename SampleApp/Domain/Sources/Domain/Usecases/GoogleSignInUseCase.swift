//
//  GoogleSignInUseCase.swift
//  Domain
//
//  Created by Marcin Wawrzyniak on 03/12/2025.
//

public protocol GoogleSignInUseCase: Sendable {
    func execute() async throws -> User
}

