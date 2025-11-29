//
//  SocialSignInButtonsView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import SwiftUI
import AuthenticationServices

struct SocialSignInButtonsView: View {
    var onAppleRequest: (ASAuthorizationAppleIDRequest) -> Void
    var onAppleCompletion: (Result<ASAuthorization, Error>) -> Void
    var onGoogleTap: () -> Void

    var body: some View {
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
                        .symbolRenderingMode(.multicolor)
                        .imageScale(.large)
                    Text("Zaloguj się przez Google")
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(Color(uiColor: .systemBackground))
            }
            .buttonStyle(.bordered)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
    }
}

#Preview {
    SocialSignInButtonsView { _ in } onAppleCompletion: { _ in } onGoogleTap: {}
        .padding()
}
