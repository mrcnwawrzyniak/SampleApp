//
//  LoginFieldsView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import SwiftUI

public struct LoginFieldsView: View {
    @ObservedObject public var vm: LoginViewModel

    public init(vm: LoginViewModel) {
        self.vm = vm
    }
    
    public var body: some View {
        VStack(spacing: 12) {
            TextField(String(localized: "E-mail"), text: $vm.state.email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding(12)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))

            HStack(spacing: 8) {
                Group {
                    if vm.state.isSecure {
                        SecureField(String(localized: "Password"), text: $vm.state.password)
                    } else {
                        TextField(String(localized: "Password"), text: $vm.state.password)
                    }
                }
                .textContentType(.password)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()

                Button(action: { vm.state.isSecure.toggle() }) {
                    Image(systemName: vm.state.isSecure ? "eye.slash" : "eye")
                        .foregroundStyle(.secondary)
                }
                .buttonStyle(.plain)
            }
            .padding(12)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
    }
}
#Preview {
    LoginFieldsView(vm: LoginViewModel())
        .padding()
}
