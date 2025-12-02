//
//  LoginHeaderView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import SwiftUI
import DesignSystem

public struct LoginHeaderView: View {
    public init() {}

    public var body: some View {
        VStack(spacing: 20) {
            Text(L10n.Login.Header.title)
                .font(.largeTitle).bold()
            Text(L10n.Login.Header.subtitle)
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
