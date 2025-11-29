//
//  LoginView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//


import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Login")
                .font(.largeTitle)
            Text("Tu będzie formularz logowania")
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

#Preview("LoginView") {
    LoginView()
}

