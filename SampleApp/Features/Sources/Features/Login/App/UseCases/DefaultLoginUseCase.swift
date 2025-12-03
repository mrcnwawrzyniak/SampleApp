//
//  DefaultLoginUseCase.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 03/12/2025.
//

import Foundation
import Domain
import FirebaseAuth

final class DefaultLoginUseCase: LoginUseCase {
    private let credentialsValidator: CredentialsValidator
    
    init(credentialsValidator: CredentialsValidator){
        self.credentialsValidator = credentialsValidator
    }
    
    func login(email: String, password: String) async throws -> User {
        
        guard credentialsValidator.isValidEmail(email) else {
            throw LoginError.invalidCredentials
        }
        
        guard credentialsValidator.isPasswordValid(password ) else {
            throw LoginError.invalidCredentials
        }
    
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        
        guard let user = authResult.user else {
            throw LoginError.userNotFound
        }
        
        return user
    }
}

enum LoginError: Error {
    case userNotFound
    case invalidCredentials
}
