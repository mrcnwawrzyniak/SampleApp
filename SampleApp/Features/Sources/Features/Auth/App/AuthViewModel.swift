//
//  AuthViewModel.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 05/12/2025.
//

import Foundation
import Domain
import Core

@MainActor
public class AuthViewModel: ObservableObject {
    @Published public var authState: AuthState = AuthState()

    @Injected(\.getCurrentUserUseCase) private var getCurrentUserUseCase
    @Injected(\.signOutUseCase) private var signOutUseCase

    public init() {
        Task {
            await checkAuthenticationStatus()
        }
    }

    public func checkAuthenticationStatus() async {
        authState.isAuthenticating = true

        do {
            if let user = await getCurrentUserUseCase.execute() {
                authState.currentUser = user
                authState.isAuthenticated = true
            } else {
                authState.currentUser = nil
                authState.isAuthenticated = false
            }
        }

        authState.isAuthenticating = false
    }

    public func signOut() {
        Task {
            do {
                try await signOutUseCase.execute()
                authState.currentUser = nil
                authState.isAuthenticated = false
                authState.error = nil
            } catch {
                authState.error = error.localizedDescription
            }
        }
    }

    public func setAuthenticated(user: FirebaseUser) {
        authState.currentUser = user
        authState.isAuthenticated = true
        authState.error = nil
    }
}
