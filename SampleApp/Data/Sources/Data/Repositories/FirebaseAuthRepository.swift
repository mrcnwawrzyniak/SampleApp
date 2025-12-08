import Foundation
import Domain
import FirebaseAuth
import GoogleSignIn

public final class FirebaseAuthRepository: AuthRepositoryProtocol {

    public init() {}

    public func signInWithCredentials(email: String, password: String) async throws -> FirebaseUser {
        do {
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            return authResult.user.toDomainUser(provider: .email)
        } catch let error as NSError {
            throw mapFirebaseError(error)
        }
    }

    public func signInWithGoogle() async throws -> FirebaseUser {
        guard let clientID = Auth.auth().app?.options.clientID else {
            throw AuthError.unknown(NSError(
                domain: "GoogleSignIn",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Missing client ID"]
            ))
        }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        guard let windowScene = await UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = await windowScene.windows.first?.rootViewController else {
            throw AuthError.unknown(NSError(
                domain: "GoogleSignIn",
                code: -2,
                userInfo: [NSLocalizedDescriptionKey: "No root view controller"]
            ))
        }

        do {
            let result = try await GIDSignIn.sharedInstance.signIn(
                withPresenting: rootViewController
            )

            guard let idToken = result.user.idToken?.tokenString else {
                throw AuthError.unknown(NSError(
                    domain: "GoogleSignIn",
                    code: -3,
                    userInfo: [NSLocalizedDescriptionKey: "Missing ID token"]
                ))
            }

            let accessToken = result.user.accessToken.tokenString
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: accessToken
            )

            let authResult = try await Auth.auth().signIn(with: credential)
            return authResult.user.toDomainUser(provider: .google)

        } catch {
            if (error as NSError).code == GIDSignInError.canceled.rawValue {
                throw AuthError.cancelled
            }
            throw AuthError.unknown(error)
        }
    }

    public func signOut() async throws {
        do {
            try Auth.auth().signOut()
            GIDSignIn.sharedInstance.signOut()
        } catch let error as NSError {
            throw mapFirebaseError(error)
        }
    }

    public func getCurrentUser() async -> FirebaseUser? {
        guard let firebaseUser = Auth.auth().currentUser else {
            return nil
        }

        let provider: AuthProvider
        if let providerData = firebaseUser.providerData.first {
            switch providerData.providerID {
            case "google.com":
                provider = .google
            default:
                provider = .email
            }
        } else {
            provider = .email
        }

        return firebaseUser.toDomainUser(provider: provider)
    }

    private func mapFirebaseError(_ error: NSError) -> AuthError {
        guard let errorCode = AuthErrorCode(rawValue: error.code) else {
            return .unknown(error)
        }

        switch errorCode {
        case .userNotFound:
            return .userNotFound
        case .wrongPassword:
            return .wrongPassword
        case .invalidEmail:
            return .invalidEmail
        case .networkError:
            return .networkError
        case .emailAlreadyInUse:
            return .emailAlreadyInUse
        default:
            return .unknown(error)
        }
    }
}

private extension FirebaseAuth.User {
    func toDomainUser(provider: AuthProvider) -> Domain.FirebaseUser {
        Domain.FirebaseUser(
            id: uid,
            email: email,
            displayName: displayName,
            photoURL: photoURL,
            provider: provider
        )
    }
}
