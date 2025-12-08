public struct Geo: Equatable, Codable {
    public let lat: String
    public let lng: String

    public init(lat: String, lng: String) {
        self.lat = lat
        self.lng = lng
    }
}