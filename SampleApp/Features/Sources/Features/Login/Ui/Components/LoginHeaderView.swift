//
//  LoginHeaderView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import SwiftUI

struct LoginHeaderView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("Logowanie")
                .font(.largeTitle).bold()
            Text("Wpisz e‑mail i hasło lub skorzystaj z logowania przez Apple / Google")
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
