//
//  LoginHeaderView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import SwiftUI

public struct LoginHeaderView: View {
    public init() {}

    public var body: some View {
        VStack(spacing: 20) {
            Text("Sign in")
                .font(.largeTitle).bold()
            Text("Insert your username and password here")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.top, 24)
    }
}

#Preview {
    LoginHeaderView()
}
