//
//  LoginView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import SwiftUI
import DesignSystem

public struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @EnvironmentObject private var authViewModel: AuthViewModel

    public init() {}

    public var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                LoginHeaderView()
             
                LoginFieldsView(vm: viewModel)
                
                Button {
                    viewModel.onAction(.loginTapped)
                } label: {
                    HStack {
                        if viewModel.state.isLoading { ProgressView().tint(.white) }
                        Text(L10n.Login.Button.login)
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                }
                .buttonStyle(.borderedProminent)
                .disabled(viewModel.state.isLoading)
                
                SeparatorView()

                SocialSignInButtonsView(onGoogleTap: {
                    viewModel.onAction(.googleSignInTapped)
                })
            }
            .padding()
            .frame(maxWidth: 400)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
        .dismissKeyboardOnTap()
        .onAppear {
            viewModel.onLoginSuccess = { user in
                authViewModel.setAuthenticated(user: user)
            }
        }
    }
}

#Preview("LoginView") {
    LoginView()
}
