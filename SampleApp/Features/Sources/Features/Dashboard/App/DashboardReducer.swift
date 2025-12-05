//
//  DashboardReducer.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 01/12/2025.
//

struct DashboardReducer {
    public static func reduce(into state: inout DashboardState, action: DashboardAction) {
        switch action {
        case .ShowLogoutAlertDialog:
            state.isLogoutAlertDialogVisible.toggle()
        case .ShowSettings:
            state.isSettingsVisible.toggle()
        case .Logout:
            break
        }
    }
}
