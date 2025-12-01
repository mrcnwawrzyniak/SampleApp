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
            Button("Show Logout Alert dialog", action: {
                viewModel.onAction(.ShowLogoutAlertDialog)
            })
            Button("Show Settings Modal", action: {
                viewModel.onAction(.ShowSettings)
            })
        }
    }
}

#Preview("DashboardView"){
    DashboardView()
}

