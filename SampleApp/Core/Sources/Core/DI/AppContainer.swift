import Factory
import Domain
import Data

public extension Container {
    var authRepository: Factory<AuthRepository> {
        self { FirebaseAuthRepository() }
            .singleton
    }

    var credentialsValidator: Factory<CredentialsValidator> {
        self { CredentialsValidator() }
    }

    var credentialsSignInUseCase: Factory<CredentialsSignInUseCase> {
        self { DefaultCredentialsSignInUseCase(authRepository: self.authRepository()) }
    }

    var googleSignInUseCase: Factory<GoogleSignInUseCase> {
        self { DefaultGoogleSignInUseCase(authRepository: self.authRepository()) }
    }

    var getCurrentUserUseCase: Factory<GetCurrentUserUseCase> {
        self { DefaultGetCurrentUserUseCase(authRepository: self.authRepository()) }
    }

    var signOutUseCase: Factory<SignOutUseCase> {
        self { DefaultSignOutUseCase(authRepository: self.authRepository()) }
    }
}
