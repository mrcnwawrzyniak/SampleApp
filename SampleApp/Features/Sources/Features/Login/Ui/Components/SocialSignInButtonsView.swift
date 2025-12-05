//
//  SocialSignInButtonsView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import SwiftUI
import DesignSystem

public struct SocialSignInButtonsView: View {
    var onGoogleTap: () -> Void

    public init(onGoogleTap: @escaping () -> Void) {
        self.onGoogleTap = onGoogleTap
    }

    public var body: some View {
        VStack(spacing: 12) {
            Button(action: onGoogleTap) {
                HStack(spacing: 8) {
                    Image(systemName: "g.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    Text(L10n.logInViaGoogle)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    SocialSignInButtonsView(onGoogleTap: {})
        .padding()
}
