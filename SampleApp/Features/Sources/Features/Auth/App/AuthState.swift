//
//  AuthState.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 05/12/2025.
//

import Foundation
import Domain

public struct AuthState: Equatable {
    public var isAuthenticated: Bool = false
    public var isAuthenticating: Bool = false
    public var currentUser: FirebaseUser? = nil
    public var error: String? = nil

    public static func == (lhs: AuthState, rhs: AuthState) -> Bool {
        return lhs.isAuthenticated == rhs.isAuthenticated &&
               lhs.isAuthenticating == rhs.isAuthenticating &&
               lhs.currentUser?.id == rhs.currentUser?.id &&
               lhs.error == rhs.error
    }
}
