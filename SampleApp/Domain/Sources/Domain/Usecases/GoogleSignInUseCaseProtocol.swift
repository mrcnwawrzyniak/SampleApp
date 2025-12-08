//
//  GoogleSignInUseCase.swift
//  Domain
//
//  Created by Marcin Wawrzyniak on 03/12/2025.
//

public protocol GoogleSignInUseCaseProtocol: Sendable {
    func execute() async throws -> FirebaseUser
}

