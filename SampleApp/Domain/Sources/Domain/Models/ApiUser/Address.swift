
public struct Address: Equatable, Codable {
    public let street: String
    public let suite: String
    public let city: String
    public let zipcode: String
    public let geo: Geo

    public init(street: String, suite: String, city: String, zipcode: String, geo: Geo) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }

    public var fullAddress: String {
        "\(street), \(suite), \(city) \(zipcode)"
    }
}