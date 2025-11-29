//
//  AuthErrorView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import SwiftUI

struct AuthErrorView: View {
    let message: String

    var body: some View {
        Text(message)
            .font(.footnote)
            .foregroundStyle(.red)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    AuthErrorView(message: "Błąd logowania")
}
