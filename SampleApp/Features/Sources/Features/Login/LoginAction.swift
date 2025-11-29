//
//  LoginAction.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//


enum LoginIntent: Equatable {
    case onAppear
    case onEmailChanged(String)
    case onPasswordChanged(String)
    case onSubmit
    case onLogout
}


