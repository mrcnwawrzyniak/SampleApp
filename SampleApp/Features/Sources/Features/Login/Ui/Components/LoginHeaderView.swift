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
            Text(String(localized: "login.header.title"))
                .font(.largeTitle).bold()
            Text(String(localized: "login.header.subtitle"))
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
