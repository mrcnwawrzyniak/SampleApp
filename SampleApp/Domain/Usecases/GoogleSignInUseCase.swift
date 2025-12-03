//
//  GoogleSignInUseCase.swift
//  Domain
//
//  Created by Marcin Wawrzyniak on 03/12/2025.
//

public protocol GoogleSignInUseCase {
    func signIn(completion: @escaping (Result<Void, Error>) -> Void)
}
