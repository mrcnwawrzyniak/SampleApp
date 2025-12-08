//
//  Company.swift
//  Domain
//
//  Created by Marcin Wawrzyniak on 08/12/2025.
//


public struct Company: Equatable, Codable, Sendable {
    public let name: String
    public let catchPhrase: String
    public let bs: String

    public init(name: String, catchPhrase: String, bs: String) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
}
