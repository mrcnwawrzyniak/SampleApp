//
//  AuthErrorView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import SwiftUI

public struct AuthErrorView: View {
    let message: String

    public init(message: String) {
        self.message = message
    }

    public var body: some View {
        Text(message)
            .font(.footnote)
            .foregroundStyle(.red)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    AuthErrorView(message: String(localized: "login.error.loginFailed"))
}
