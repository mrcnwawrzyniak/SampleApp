//
//  LoginFieldsView.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

import SwiftUI

struct LoginFieldsView: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var isSecure: Bool

    var body: some View {
        VStack(spacing: 12) {
            TextField("E‑mail", text: $email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding(12)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))

            HStack(spacing: 8) {
                Group {
                    if isSecure {
                        SecureField("Hasło", text: $password)
                    } else {
                        TextField("Hasło", text: $password)
                    }
                }
                .textContentType(.password)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()

                Button(action: { isSecure.toggle() }) {
                    Image(systemName: isSecure ? "eye.slash" : "eye")
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
    StatefulPreviewWrapper(("", "", true)) { email, password, isSecure in
        LoginFieldsView(email: email, password: password, isSecure: isSecure)
            .padding()
    }
}

// Utility to preview bindings
struct StatefulPreviewWrapper<Value1, Value2, Value3, Content: View>: View {
    @State var value1: Value1
    @State var value2: Value2
    @State var value3: Value3
    var content: (_ binding1: Binding<Value1>, _ binding2: Binding<Value2>, _ binding3: Binding<Value3>) -> Content

    init(_ values: (Value1, Value2, Value3), @ViewBuilder content: @escaping (_ binding1: Binding<Value1>, _ binding2: Binding<Value2>, _ binding3: Binding<Value3>) -> Content) {
        _value1 = State(initialValue: values.0)
        _value2 = State(initialValue: values.1)
        _value3 = State(initialValue: values.2)
        self.content = content
    }

    var body: some View {
        content($value1, $value2, $value3)
    }
}
