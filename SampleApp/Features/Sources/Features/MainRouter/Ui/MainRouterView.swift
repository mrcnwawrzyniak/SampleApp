//
//  MainRouterView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 03/12/2025.
//

import SwiftUI

public struct MainRouterView: View {
    @StateObject private var router = MainRouter()
    @StateObject private var authViewModel = AuthViewModel()

    public init() {}

    public var body: some View {
        Group {
            if authViewModel.authState.isAuthenticating {
                ProgressView()
            } else {
                NavigationStack(path: $router.path) {
                    destinationView(for: authViewModel.authState.isAuthenticated ? .dashboard : .login)
                        .navigationDestination(for: MainRoute.self) { route in
                            destinationView(for: route)
                        }
                }
                .environmentObject(router)
                .environmentObject(authViewModel)
            }
        }
    }

    @ViewBuilder
    private func destinationView(for route: MainRoute) -> some View {
        switch route {
        case .login:
            LoginView()
        case .dashboard:
            DashboardView()
        }
    }
}
