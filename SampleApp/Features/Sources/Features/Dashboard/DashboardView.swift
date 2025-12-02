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

    public init() {}

    public var body: some View {
        VStack(spacing: 30){
            Button(L10n.Dashboard.Button.logoutAlert, action: {
                viewModel.onAction(.ShowLogoutAlertDialog)
            })
            Button(L10n.Dashboard.Button.settings, action: {
                viewModel.onAction(.ShowSettings)
            })
        }
        .alert(L10n.Dashboard.Alert.confirmLogout, isPresented: $viewModel.state.isLogoutAlertDialogVisible) {
            Button(L10n.Dashboard.Alert.Button.cancel, role: .cancel) {}
            Button(L10n.Dashboard.Alert.Button.logout, role: .destructive) {
                // Obsługa wylogowania
            }
        }
    }
}

#Preview("DashboardView"){
    DashboardView()
}
