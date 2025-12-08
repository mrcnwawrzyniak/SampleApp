//
//  Geo.swift
//  Domain
//
//  Created by Marcin Wawrzyniak on 08/12/2025.
//


public struct Geo: Equatable, Codable, Sendable {
    public let lat: String
    public let lng: String

    public init(lat: String, lng: String) {
        self.lat = lat
        self.lng = lng
    }
}
