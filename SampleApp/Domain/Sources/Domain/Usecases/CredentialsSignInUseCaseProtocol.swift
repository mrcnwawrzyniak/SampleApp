//
//  LoginUsecase.swift
//  Domain
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

public protocol CredentialsSignInUseCaseProtocol: Sendable {
    func execute(email: String, password: String) async throws -> FirebaseUser
}

