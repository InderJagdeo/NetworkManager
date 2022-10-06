//
//  Router.swift
//  CountriesList
//
//  Created by Macbook on 03/03/2022.
//

import Foundation

typealias HTTPParameters = [String: Any]?

enum Router {

    case all
    case name(String)
    
    // MARK: - HTTP Method
    var method: HTTPMethod {
        switch self {
        case .all, .name:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .all:
            return "all"
        case .name:
            return "name"
        }
    }
    
    // MARK: - Parameters
    var parameters: HTTPParameters {
        switch self {
        case .name(let name):
            return ["name": name]
        default:
            return nil
        }
    }

    var url: URL {
        guard let url = URL(string: kNetworkEnvironment.baseURL + "/v3.1/") else {
            fatalError(ErrorMessage.invalidUrl.rawValue)
        }
        return url
    }
    
    // MARK: - URLRequestConvertible
    func requestURL() throws -> URLRequest {

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))

        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        urlRequest.cachePolicy = kRequestCachePolicy
        urlRequest.timeoutInterval = kTimeoutInterval

        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)

        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw ErrorMessage.encodingFailed
            }
        }
        return urlRequest
    }
}
