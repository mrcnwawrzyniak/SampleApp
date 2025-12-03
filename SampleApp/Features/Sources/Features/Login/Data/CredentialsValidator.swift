//
//  Email.swift
//  Features
//
//  Created by Marcin Wawrzyniak on 03/12/2025.
//

struct CredentialsValidator {
    func isEmailValid(email: String) -> Bool {
        let emailRegExp = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegExp)
        return emailTest.evaluate(withObject: email)
    }
    
    func isPasswordValid(password: String) -> Bool {
        return password.count > 6
    }
}
