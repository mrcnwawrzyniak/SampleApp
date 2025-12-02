//
//  LoginFieldsView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import SwiftUI
import DesignSystem

public struct LoginFieldsView: View {
    @ObservedObject public var vm: LoginViewModel
    @FocusState private var focusedField: Field?
    
    enum Field {
        case email, password
    }

    public init(vm: LoginViewModel) {
        self.vm = vm
    }
    
    public var body: some View {
        VStack(spacing: 12) {
            TextField(L10n.email, text: $vm.state.email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding(12)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                .focused($focusedField, equals: .email)
                .submitLabel(.next)
                .onSubmit {
                    focusedField = .password
                }

            HStack(spacing: 8) {
                Group {
                    if vm.state.isSecure {
                        SecureField(L10n.password, text: $vm.state.password)
                    } else {
                        TextField(L10n.password, text: $vm.state.password)
                    }
                }
                .textContentType(.password)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .focused($focusedField, equals: .password)
                .submitLabel(.done)

                Button(action: { vm.state.isSecure.toggle() }) {
                    Image(systemName: vm.state.isSecure ? "eye.slash" : "eye")
                        .foregroundStyle(.secondary)
                }
                .buttonStyle(.plain)
            }
            .padding(12)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
        .onAppear {
            // Automatyczny focus na email po 0.5 sekundy
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                focusedField = .email
            }
        }
    }
}
#Preview {
    LoginFieldsView(vm: LoginViewModel())
        .padding()
}
