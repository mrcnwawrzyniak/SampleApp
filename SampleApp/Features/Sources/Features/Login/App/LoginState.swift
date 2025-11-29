//
//  LoginState.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

struct LoginState {
    var email: String = ""
    var password: String = ""
    var isLoading: Bool = false
    var error: String? = nil
    var isLoggedIn: Bool = false
}
