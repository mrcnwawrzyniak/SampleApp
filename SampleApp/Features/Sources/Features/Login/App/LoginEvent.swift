//
//  LoginEvent.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 29/11/2025.
//

enum LoginEvent: Equatable {
    case loginSucceeded(userID: String)
    case loginFailed(message: String)
}
