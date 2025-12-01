//
//  SocialSignInButtonsView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import SwiftUI
import AuthenticationServices

public struct SocialSignInButtonsView: View {
    var onAppleRequest: (ASAuthorizationAppleIDRequest) -> Void
    var onAppleCompletion: (Result<ASAuthorization, Error>) -> Void
    var onGoogleTap: () -> Void

    public init(
        onAppleRequest: @escaping (ASAuthorizationAppleIDRequest) -> Void,
        onAppleCompletion: @escaping (Result<ASAuthorization, Error>) -> Void,
        onGoogleTap: @escaping () -> Void
    ) {
        self.onAppleRequest = onAppleRequest
        self.onAppleCompletion = onAppleCompletion
        self.onGoogleTap = onGoogleTap
    }

    public var body: some View {
        VStack(spacing: 12) {
            SignInWithAppleButton(.signIn) { request in
                onAppleRequest(request)
            } onCompletion: { result in
                onAppleCompletion(result)
            }
            .signInWithAppleButtonStyle(.black)
            .frame(height: 48)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

            Button(action: onGoogleTap) {
                HStack(spacing: 8) {
                    Image(systemName: "g.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    Text("Zaloguj się przez Google")
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 6)

            }
            .buttonStyle(.bordered)
            .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
        }
    }
}

#Preview {
    SocialSignInButtonsView { _ in } onAppleCompletion: { _ in } onGoogleTap: {}
        .padding()
}
