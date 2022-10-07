//
//  NetworkErrorMapper.swift
//  CountriesList
//
//  Created by Macbook on 06/10/22.
//

import Foundation

enum ErrorHandler {
    case mapNetworkError(_ statusCode: Int)
    case handleNetworkError(_ error: Error)

    var error: NetworkError {
        switch self {
        case .mapNetworkError(let statusCode):
            switch statusCode {
            case 400: return .badRequest(code: statusCode)
            case 401: return .unauthorized(code: statusCode)
            case 403: return .forbidden(code: statusCode)
            case 404: return .notFound(code: statusCode)
            case 402, 405...599: return .serverError(code: statusCode)
            default: return .unknown(ErrorMessage.unknowError.rawValue)
            }
        case .handleNetworkError(let error):
            switch error {
            case is Swift.DecodingError:
                return .invalidResponse(error.localizedDescription)
            case let urlError as URLError:
                return .badURL(urlError.localizedDescription)
            case let error as NetworkError:
                return error
            default:
                return .unknown(error.localizedDescription)
            }
        }
    }
}
