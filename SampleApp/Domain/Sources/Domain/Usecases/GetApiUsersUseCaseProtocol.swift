//
//  File.swift
//  Domain
//
//  Created by Marcin Wawrzyniak on 08/12/2025.
//

import Foundation

public protocol GetApiUsersUseCaseProtocol {
    func execute() async throws -> [ApiUser]
}
