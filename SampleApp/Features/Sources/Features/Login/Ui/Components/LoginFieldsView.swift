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
    
    private var emailError: String? {
        if let error = vm.state.error {
            if error == "Email cannot be empty" || error == "Please enter a valid email" {
                return error
            }
        }
        return nil
    }
    
    private var passwordError: String? {
        if let error = vm.state.error {
            if error == "Password cannot be empty" || error == "Password must be at least 6 characters" {
                return error
            }
        }
        return nil
    }
    
    public var body: some View {
        VStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                TextField(L10n.email, text: $vm.state.email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .padding(12)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(emailError != nil ? Color.red : Color.clear, lineWidth: 1.5)
                    )
                    .focused($focusedField, equals: .email)
                    .submitLabel(.next)
                    .onSubmit {
                        focusedField = .password
                    }
                
                if let emailError = emailError {
                    Text(emailError)
                        .foregroundColor(.red)
                        .font(.footnote)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
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
                    .padding(12)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(passwordError != nil ? Color.red : Color.clear, lineWidth: 1.5)
                    )
                    
                    Button(action: { vm.state.isSecure.toggle() }) {
                        Image(systemName: vm.state.isSecure ? "eye.slash" : "eye")
                            .foregroundStyle(.secondary)
                    }
                    .buttonStyle(.plain)
                }
                
                if let passwordError = passwordError {
                    Text(passwordError)
                        .foregroundColor(.red)
                        .font(.footnote)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.leading, 12) // Align error text with text field padding
                }
            }
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
