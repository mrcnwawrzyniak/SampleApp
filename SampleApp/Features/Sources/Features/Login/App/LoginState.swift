//
//  LoginState.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

public struct LoginState {
    public var email: String = ""
    public var password: String = ""
    public var isLoading: Bool = false
    public var error: String? = nil
    public var isLoggedIn: Bool = false
    public var isSecure: Bool = true

    public init() {}
}
