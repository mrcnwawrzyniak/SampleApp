//
//  DashboardView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 01/12/2025.
//

import SwiftUI

public struct DashboardView : View {
    @StateObject private var viewModel = DashboardViewModel()
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 30){
            Button(String(localized: "dashboard.button.logoutAlert"), action: {
                viewModel.onAction(.ShowLogoutAlertDialog)
            })
            Button(String(localized: "dashboard.button.settings"), action: {
                viewModel.onAction(.ShowSettings)
            })
        }
        .alert(String(localized: "dashboard.alert.confirmLogout"), isPresented: $viewModel.state.isLogoutAlertDialogVisible) {
            Button(String(localized: "dashboard.alert.button.cancel"), role: .cancel) {}
            Button(String(localized: "dashboard.alert.button.logout"), role: .destructive) {
                // Obsługa wylogowania
            }
        }
    }
}

#Preview("DashboardView"){
    DashboardView()
}
