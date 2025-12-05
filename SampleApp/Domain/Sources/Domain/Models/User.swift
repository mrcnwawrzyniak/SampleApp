import Foundation

public struct User: Sendable {
    public let id: String
    public let email: String?
    public let displayName: String?
    public let photoURL: URL?
    public let provider: AuthProvider

    public init(
        id: String,
        email: String?,
        displayName: String?,
        photoURL: URL?,
        provider: AuthProvider
    ) {
        self.id = id
        self.email = email
        self.displayName = displayName
        self.photoURL = photoURL
        self.provider = provider
    }
}
