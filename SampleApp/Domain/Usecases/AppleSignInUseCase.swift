//
//  AppleSignInUseCase.swift
//  Domain
//
//  Created by Marcin Wawrzyniak on 03/12/2025.
//

public protocol AppleSignInUseCase {
    func signIn(
        onSuccess: @escaping (User) -> Void,
        onFailure: @escaping (Error) -> Void
    )
}
