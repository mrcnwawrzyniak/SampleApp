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
        ScrollView {
            VStack(spacing: 40) {
                LoginHeaderView()
                
                if let message = viewModel.state.error {
                    AuthErrorView(message: message)
                }
                
                LoginFieldsView(vm: viewModel)
                
                Button {
                    viewModel.onAction(.loginTapped)
                } label: {
                    HStack {
                        if viewModel.state.isLoading { ProgressView().tint(.white) }
                        Text(String(localized: "login.button.login"))
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
                    viewModel.onAction(.appleSignInCompleted(result))
                } onGoogleTap: {
                    viewModel.onAction(.googleSignInTapped)
                }
            }
            .padding()
            .frame(maxWidth: 400)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
        .dismissKeyboardOnTap()
    }
}

#Preview("LoginView") {
    LoginView()
}
