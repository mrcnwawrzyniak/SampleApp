//
//  LoginReducer.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

struct LoginReducer {
    static func reduce(state: inout LoginState, action: LoginAction) {
        switch action {
        case .emailChanged(let email):
            state.email = email
            
        case .passwordChanged(let password):
            state.password = password
            
        case .loginTapped:
            state.isLoading = true
            state.error = nil
            
        case .loginSuccess:
            state.isLoading = false
            state.isLoggedIn = true
            
        case .loginFailure(let message):
            state.isLoading = false
            state.error = message
        }
    }
}
