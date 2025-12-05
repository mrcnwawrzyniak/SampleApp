//
//  LoginViewModel.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import Foundation
import DesignSystem
import Domain
import Core

@MainActor
public final class LoginViewModel: ObservableObject {

    @Published public var state = LoginState()
    @Injected(\.credentialsSignInUseCase) private var credentialsSignInUseCase
    @Injected(\.googleSignInUseCase) private var googleSignInUseCase
    @Injected(\.credentialsValidator) private var credentialsValidator

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
        guard credentialsValidator.isEmailValid(email: state.email) else {
            onAction(.loginFailure("Please enter a valid email"))
            return
        }

        guard credentialsValidator.isPasswordValid(password: state.password) else {
            onAction(.loginFailure("Password must be at least 6 characters"))
            return
        }

        Task {
            do {
                let user = try await credentialsSignInUseCase.execute(
                    email: state.email,
                    password: state.password
                )
                onAction(.loginSuccess)
            } catch let error as AuthError {
                onAction(.loginFailure(error.errorDescription ?? "Unknown error"))
            } catch {
                onAction(.loginFailure(error.localizedDescription))
            }
        }
    }

    private func handleGoogleSignIn() {
        Task {
            do {
                let user = try await googleSignInUseCase.execute()
                onAction(.loginSuccess)
            } catch let error as AuthError {
                if case .cancelled = error {
                    state.isLoading = false
                    return
                }
                onAction(.loginFailure(error.errorDescription ?? "Google sign-in failed"))
            } catch {
                onAction(.loginFailure(error.localizedDescription))
            }
        }
    }
}
