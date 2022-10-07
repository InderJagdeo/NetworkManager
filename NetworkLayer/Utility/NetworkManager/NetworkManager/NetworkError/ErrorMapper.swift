//
//  ErrorMapper.swift
//  CountriesList
//
//  Created by Macbook on 06/10/22.
//

import Foundation

struct ErrorMapper {

    let error: NetworkError

    var message: String {
        switch error {
        case .badURL(let error):
            return error.description
        case .unknown(let error):
            return error.description
        case .unreachable:
            return ErrorMessage.unreachable.rawValue
        case .invalidResponse(let error):
            return error.description
        case .notFound(let statusCode):
            return errorMessage(statusCode, error: ErrorMessage.serverNotFound)
        case .forbidden(let statusCode):
            return errorMessage(statusCode, error: ErrorMessage.forbidden)
        case .badRequest(let statusCode):
            return errorMessage(statusCode, error: ErrorMessage.invalidRequest)
        case .serverError(let statusCode):
            return errorMessage(statusCode, error: ErrorMessage.serverError)
        case .unauthorized(let statusCode):
            return errorMessage(statusCode, error: ErrorMessage.unauthorized)
        }
    }

    private func errorMessage(_ statusCode: Int, error: ErrorMessage) -> String {
        return "Status Code: \(statusCode) Error: \(error.rawValue)"
    }
}
