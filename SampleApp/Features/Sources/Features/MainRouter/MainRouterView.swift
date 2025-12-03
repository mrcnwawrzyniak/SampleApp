//
//  MainRouterView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 03/12/2025.
//

import SwiftUI
import Core

public struct MainRouterView: View {
    @StateObject private var router = MainRouter()
    
    public init() {}
    
    public var body: some View {
        NavigationStack(path: $router.path) {
            destinationView(for: router.currentRoute)
                .navigationDestination(for: MainRoute.self) { route in
                    destinationView(for: route)
                }
        }
        .environmentObject(router)
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
