import Factory
import Domain
import Data

public extension Container {
    var authRepository: Factory<AuthRepositoryProtocol> {
        self { FirebaseAuthRepository() }
            .singleton
    }

    var credentialsValidator: Factory<CredentialsValidator> {
        self { CredentialsValidator() }
    }

    var credentialsSignInUseCase: Factory<CredentialsSignInUseCaseProtocol> {
        self { DefaultCredentialsSignInUseCase(authRepository: self.authRepository()) }
    }

    var googleSignInUseCase: Factory<GoogleSignInUseCaseProtocol> {
        self { DefaultGoogleSignInUseCase(authRepository: self.authRepository()) }
    }

    var getCurrentUserUseCase: Factory<GetCurrentUserUseCaseProtocol> {
        self { DefaultGetCurrentUserUseCase(authRepository: self.authRepository()) }
    }

    var signOutUseCase: Factory<SignOutUseCaseProtocol> {
        self { DefaultSignOutUseCase(authRepository: self.authRepository()) }
    }
}
