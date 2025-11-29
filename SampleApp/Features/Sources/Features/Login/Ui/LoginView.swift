//
//  LoginView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        VStack(spacing: 20) {
            LoginHeaderView()

           

            if let message = viewModel.errorMessage {
                AuthErrorView(message: message)
            }

            Button {
                Task { await viewModel.performEmailLogin() }
            } label: {
                HStack {
                    if viewModel.isLoading { ProgressView().tint(.white) }
                    Text("Zaloguj się")
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
            }
            .buttonStyle(.borderedProminent)
            .disabled(!viewModel.canSubmit || viewModel.isLoading)

            SeparatorView()

            SocialSignInButtonsView { request in
                request.requestedScopes = [.fullName, .email]
            } onAppleCompletion: { result in
                viewModel.handleAppleSignIn(result)
            } onGoogleTap: {
                // TODO: Integrate Google Sign-In SDK (GoogleSignIn)
                viewModel.errorMessage = nil
            }

            Spacer(minLength: 0)
        }
        .padding()
    }
}

#Preview("LoginView") {
    LoginView()
}
