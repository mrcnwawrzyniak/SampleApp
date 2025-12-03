//
//  SampleAppApp.swift
//  SampleApp
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import SwiftUI
import Features
import FirebaseCore

@main
struct SampleAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            MainRouterView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
