//
//  LoginView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import SwiftUI
import AuthenticationServices

public struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()

    public init() {}

    public var body: some View {
        VStack(spacing: 20) {
            LoginHeaderView()

            if let message = viewModel.state.error {
                AuthErrorView(message: message)
            }

            Button {
                viewModel.sendLogin(.loginTapped)
            } label: {
                HStack {
                    if viewModel.state.isLoading { ProgressView().tint(.white) }
                    Text("Zaloguj się")
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.state.isLoading)

            SeparatorView()

            SocialSignInButtonsView { request in
                request.requestedScopes = [.fullName, .email]
            } onAppleCompletion: { result in
                viewModel.sendLogin(.appleSignInCompleted(result))
            } onGoogleTap: {
                viewModel.sendLogin(.googleSignInTapped)
            }

            Spacer(minLength: 0)
        }
        .padding()
    }
}

#Preview("LoginView") {
    LoginView()
}
