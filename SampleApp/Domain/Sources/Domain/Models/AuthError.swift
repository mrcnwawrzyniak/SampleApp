import Foundation

public enum AuthError: LocalizedError, Sendable {
    case invalidEmail
    case invalidPassword
    case userNotFound
    case wrongPassword
    case emailAlreadyInUse
    case networkError
    case cancelled
    case unknown(Error)

    public var errorDescription: String? {
        switch self {
        case .invalidEmail:
            return "Invalid email address"
        case .invalidPassword:
            return "Password must be at least 6 characters"
        case .userNotFound:
            return "User not found"
        case .wrongPassword:
            return "Incorrect password"
        case .emailAlreadyInUse:
            return "Email already in use"
        case .networkError:
            return "Network error occurred"
        case .cancelled:
            return "Authentication cancelled"
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
