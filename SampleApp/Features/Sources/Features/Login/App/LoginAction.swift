//
//  LoginAction.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import AuthenticationServices

public enum LoginAction: Equatable {
    case emailChanged(String)
    case passwordChanged(String)
    case loginTapped
    case loginSuccess
    case loginFailure(String)
    case appleSignInCompleted(Result<ASAuthorization, Error>)
    case googleSignInTapped

    public static func == (lhs: LoginAction, rhs: LoginAction) -> Bool {
        switch (lhs, rhs) {
        case (.emailChanged(let a), .emailChanged(let b)): return a == b
        case (.passwordChanged(let a), .passwordChanged(let b)): return a == b
        case (.loginTapped, .loginTapped): return true
        case (.loginSuccess, .loginSuccess): return true
        case (.loginFailure(let a), .loginFailure(let b)): return a == b
        case (.appleSignInCompleted, .appleSignInCompleted): return true
        case (.googleSignInTapped, .googleSignInTapped): return true
        default: return false
        }
    }
}


