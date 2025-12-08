//
//  DashboardView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 01/12/2025.
//

import SwiftUI
import DesignSystem

public struct DashboardView : View {
    @StateObject private var viewModel = DashboardViewModel()
    @EnvironmentObject private var authViewModel: AuthViewModel

    public init() {}

    public var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Current User Header
                if let currentUser = viewModel.state.currentUser {
                    CurrentUserHeaderView(user: currentUser)
                        .padding(.horizontal)
                }

                // Action Buttons
                HStack(spacing: 12) {
                    Button(action: {
                        viewModel.onAction(.RefreshUsers)
                    }) {
                        Label("Refresh", systemImage: "arrow.clockwise")
                            .font(.subheadline)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(viewModel.state.isLoadingUsers)

                    Button(L10n.Dashboard.Button.settings, action: {
                        viewModel.onAction(.ShowSettings)
                    })
                    .font(.subheadline)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(.primary)
                    .cornerRadius(10)

                    Button(L10n.Dashboard.Button.logoutAlert, action: {
                        viewModel.onAction(.ShowLogoutAlertDialog)
                    })
                    .font(.subheadline)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.red.opacity(0.2))
                    .foregroundColor(.red)
                    .cornerRadius(10)
                }
                .padding(.horizontal)

                // Section Title
                HStack {
                    Text("API Users")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    if viewModel.state.isLoadingUsers {
                        ProgressView()
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)

                // Error Message
                if let errorMessage = viewModel.state.errorMessage {
                    HStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.red)
                        Text(errorMessage)
                            .font(.subheadline)
                            .foregroundColor(.red)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal)
                }

                // Users List
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.state.apiUsers) { user in
                        ApiUserCardView(user: user)
                            .padding(.horizontal)
                    }
                }

                if viewModel.state.apiUsers.isEmpty && !viewModel.state.isLoadingUsers {
                    VStack(spacing: 12) {
                        Image(systemName: "person.3.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        Text("No users loaded")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text("Pull to refresh or tap the refresh button")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Dashboard")
        .navigationBarTitleDisplayMode(.large)
        .refreshable {
            viewModel.onAction(.RefreshUsers)
        }
        .onAppear {
            viewModel.onAction(.LoadData)
        }
        .alert(L10n.Dashboard.Alert.confirmLogout, isPresented: $viewModel.state.isLogoutAlertDialogVisible) {
            Button(L10n.Dashboard.Alert.Button.cancel, role: .cancel) {}
            Button(L10n.Dashboard.Alert.Button.logout, role: .destructive) {
                authViewModel.signOut()
            }
        }
    }
}

#Preview("DashboardView"){
    DashboardView()
}
