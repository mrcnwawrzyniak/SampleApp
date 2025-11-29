//
//  LoginAction.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

enum LoginAction: Equatable {
    case emailChanged(String)
    case passwordChanged(String)
    case loginTapped
    case loginSuccess
    case loginFailure(String)
}


