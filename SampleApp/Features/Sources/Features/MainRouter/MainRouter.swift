//
//  MainRouter.swift
//  Core
//
//  Created by Marcin Wawrzyniak on 03/12/2025.
//

import SwiftUI

public enum MainRoute: Hashable {
    case login
    case dashboard
}

@MainActor
public class MainRouter: ObservableObject {
    @Published var path = NavigationPath()
    @Published var currentRoute: MainRoute = .login
    
    func navigate(to route: MainRoute) {
        path.append(route)
        currentRoute = route
    }
    
    func navigateBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func navigateToRoot() {
        path = NavigationPath()
        currentRoute = .login
    }
}
