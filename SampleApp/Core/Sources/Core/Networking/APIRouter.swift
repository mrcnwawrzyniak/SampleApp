import Foundation
import Alamofire

public enum APIRouter: URLRequestConvertible {
    case getUsers
    case getUser(id: Int)

    private var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }

    private var path: String {
        switch self {
        case .getUsers:
            return "/users"
        case .getUser(let id):
            return "/users/\(id)"
        }
    }

    private var method: HTTPMethod {
        switch self {
        case .getUsers, .getUser:
            return .get
        }
    }

    private var parameters: Parameters? {
        switch self {
        case .getUsers, .getUser:
            return nil
        }
    }

    public func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        request.timeoutInterval = 30

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        if let parameters = parameters {
            request = try JSONEncoding.default.encode(request, with: parameters)
        }

        return request
    }
}
