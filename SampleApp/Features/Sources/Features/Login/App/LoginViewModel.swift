//
//  LoginViewModel.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import Foundation
import DesignSystem
import AuthenticationServices

@MainActor
public final class LoginViewModel: ObservableObject {
    @Published public var state = LoginState()
    
    public func onAction(_ action: LoginAction) {
        LoginReducer.reduce(state: &state, action: action)

        switch action {
        case .loginTapped:
            login()
        case .googleSignInTapped:
            handleGoogleSignIn()
        case .appleSignInCompleted(let result):
            handleAppleSignIn(result: result)
        default:
            break
        }
    }

    private func login() {
//        Task {
//            do {
//                try await authService.signIn(
//                    email: state.email, 
//                    password: state.password
//                )
//                onAction(.loginSuccess)
//            } catch {
//                onAction(.loginFailure(error.localizedDescription))
//            }
//        }
    }
    
    private func handleAppleSignIn(result: Result<ASAuthorization, Error>) {
//        Task {
//            do {
//                let authorization = try result.get()
//                try await authService.signInWithApple(authorization: authorization)
//                onAction(.loginSuccess)
//            } catch {
//                onAction(.loginFailure(error.localizedDescription))
//            }
//        }
    }

    private func handleGoogleSignIn() {
        
        onAction(.loginFailure(L10n.Login.Error.googleNotImplemented))
    }
}
