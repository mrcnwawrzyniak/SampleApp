//
//  DashboardViewModel.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 01/12/2025.
//

import Foundation

@MainActor
public final class DashboardViewModel : ObservableObject {
    @Published public var state = DashboardState()
    
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
        }
    }
}
