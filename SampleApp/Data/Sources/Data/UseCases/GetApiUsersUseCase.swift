//
//  GetApiUsersUseCase.swift
//  Data
//
//  Created by Marcin Wawrzyniak on 08/12/2025.
//

import Domain

public struct GetApiUsersUseCase: GetApiUsersUseCaseProtocol {
    private let userRepository: UsersRepositoryProtocol
    
    public init(_ userRepository: UsersRepositoryProtocol) {
        self.userRepository = userRepository
    }
    
    public func execute() async throws -> [ApiUser] {
         try await userRepository.fetchUsers()
    }
}
