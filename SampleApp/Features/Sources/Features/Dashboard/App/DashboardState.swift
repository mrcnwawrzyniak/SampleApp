//
//  DashboardState.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 01/12/2025.
//

import Domain

public struct DashboardState {
    var isLogoutAlertDialogVisible: Bool = false
    var isSettingsVisible: Bool = false
    var currentUser: FirebaseUser?
    var apiUsers: [ApiUser] = []
    var isLoadingUsers: Bool = false
    var errorMessage: String?
}
