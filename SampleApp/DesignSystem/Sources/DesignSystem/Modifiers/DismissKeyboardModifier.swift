//
//  DismissKeyboardModifier.swift
//  Features
//
//  Created on 01/12/2025.
//

import SwiftUI

public struct DismissKeyboardOnTap: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .contentShape(Rectangle())
            .onTapGesture {
                hideKeyboard()
            }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}


extension View {
   
    public func dismissKeyboardOnTap() -> some View {
        modifier(DismissKeyboardOnTap())
    }
    
    public func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
