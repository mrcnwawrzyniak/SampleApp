//
//  LoginUsecase.swift
//  Domain
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

public protocol LoginUseCase {
    func login(email: String, password: String) async throws -> User
}
