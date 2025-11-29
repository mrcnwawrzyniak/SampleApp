//
//  LoginViewModel.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
    @Published private(set) var state = LoginState()
    
    func sendLogin(_ action: LoginAction) {
        LoginReducer.reduce(state: &state, action: action)
        
       switch action {
            case .loginTapped:
                login()
            default:
                break
       }
    }
    
    private func login() {
        print("Login action triggered")
    }
}
