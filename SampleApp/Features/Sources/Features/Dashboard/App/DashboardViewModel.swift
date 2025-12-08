//
//  DashboardViewModel.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 01/12/2025.
//

import Foundation
import Domain
import Core

@MainActor
public final class DashboardViewModel : ObservableObject {
    @Published public var state = DashboardState()

    @Injected(\.getCurrentUserUseCase) private var getCurrentUserUseCase
    @Injected(\.getApiUsersUsecase) private var getApiUsersUsecase

    public init() {}

    public func onAction(_ action: DashboardAction) {
        switch action {
        case .ShowLogoutAlertDialog:
            if !self.state.isLogoutAlertDialogVisible {
                self.state.isLogoutAlertDialogVisible = true
            }

        case .ShowSettings:
            if !self.state.isSettingsVisible {
                self.state.isSettingsVisible = true
            }

        case .Logout:
            break

        case .LoadData:
            Task {
                await loadCurrentUser()
                await loadApiUsers()
            }

        case .RefreshUsers:
            Task {
                await loadApiUsers()
            }
        }
    }

    private func loadCurrentUser() async {
        state.currentUser = await getCurrentUserUseCase.execute()
    }

    private func loadApiUsers() async {
        state.isLoadingUsers = true
        state.errorMessage = nil

        do {
            let users = try await getApiUsersUsecase.execute()
            state.apiUsers = users
        } catch {
            state.errorMessage = error.localizedDescription
        }

        state.isLoadingUsers = false
    }
}
