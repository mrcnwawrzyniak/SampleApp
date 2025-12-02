//
//  LoginViewModel.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import Foundation

@MainActor
public final class LoginViewModel: ObservableObject {
    @Published public var state = LoginState()

    public init() {}

    public func onAction(_ action: LoginAction) {
        LoginReducer.reduce(state: &state, action: action)

        switch action {
            case .loginTapped:
                login()
            case .googleSignInTapped:
                handleGoogleSignIn()
            default:
                break
        }
    }

    private func login() {
        Task {
            do {
                try await Task.sleep(nanoseconds: 1_000_000_000)
                onAction(.loginSuccess)
            } catch {
                onAction(.loginFailure(error.localizedDescription))
            }
        }
    }

    private func handleGoogleSignIn() {
        onAction(.loginFailure(String(localized: "login.error.googleNotImplemented")))
    }
}
