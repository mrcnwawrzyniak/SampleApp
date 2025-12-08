import Foundation

public enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError(Error)
    case serverError(statusCode: Int, message: String?)
    case noData
    case networkError(Error)
    case unknown(Error)

    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response from server"
        case .decodingError(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        case .serverError(let statusCode, let message):
            return "Server error (\(statusCode)): \(message ?? "Unknown error")"
        case .noData:
            return "No data received from server"
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .unknown(let error):
            return "Unknown error: \(error.localizedDescription)"
        }
    }
}
