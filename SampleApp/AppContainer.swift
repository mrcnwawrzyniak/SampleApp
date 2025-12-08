//
//  AppContainer.swift
//  SampleApp
//
//  Created by Marcin Wawrzyniak on 08/12/2025.
//

extension Container {
    var authRepository: Factory<AuthRepositoryProtocol> {
        self { FirebaseAuthRepository() }
            .singleton
    }

    var userRepository: Factory<UserRepositoryProtocol> {
        self { UserRepository() }
            .singleton
    }

    var credentialsValidator: Factory<CredentialsValidator> {
        self { CredentialsValidator() }
    }

    var credentialsSignInUseCase: Factory<CredentialsSignInUseCaseProtocol> {
        self { CredentialsSignInUseCase(authRepository: self.authRepository()) }
    }

    var googleSignInUseCase: Factory<GoogleSignInUseCaseProtocol> {
        self { GoogleSignInUseCase(authRepository: self.authRepository()) }
    }

    var getCurrentUserUseCase: Factory<GetCurrentUserUseCaseProtocol> {
        self { GetCurrentUserUseCase(authRepository: self.authRepository()) }
    }

    var signOutUseCase: Factory<SignOutUseCaseProtocol> {
        self { SignOutUseCase(authRepository: self.authRepository()) }
    }
    
    var getApiUsersUseCase: Factory<GetApiUsersUseCaseProtocol> {
        self { GetApiUsersUseCase(usersRepository: self.userRepository()) }
    }
}


