import Foundation
import Alamofire

public final class NetworkService: NetworkServiceProtocol, @unchecked Sendable {
    private let session: Session

    public init(session: Session = .default) {
        self.session = session
    }

    public func request<T: Decodable & Sendable>(_ router: APIRouter) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            session.request(router)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        continuation.resume(returning: value)
                    case .failure(let error):
                        let networkError = self.handleError(error, response: response.response, data: response.data)
                        continuation.resume(throwing: networkError)
                    }
                }
        }
    }

    private func handleError(_ error: AFError, response: HTTPURLResponse?, data: Data?) -> NetworkError {
        if case .responseSerializationFailed(let reason) = error {
            if case .decodingFailed(let decodingError) = reason {
                return .decodingError(decodingError)
            }
        }

        if let statusCode = response?.statusCode {
            let message = data.flatMap { String(data: $0, encoding: .utf8) }
            return .serverError(statusCode: statusCode, message: message)
        }

        if error.isSessionTaskError || error.isTimeout {
            return .networkError(error)
        }

        return .unknown(error)
    }
}

private extension AFError {
    var isTimeout: Bool {
        if case .sessionTaskFailed(let error as NSError) = self {
            return error.code == NSURLErrorTimedOut
        }
        return false
    }
}
