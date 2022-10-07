//
//  NetworkError.swift
//  CountriesList
//
//  Created by Macbook on 17/08/2022.
//

import Foundation

public enum NetworkError: Error, Equatable {
    case badURL(_ error: String)
    case unknown(_ error: String)
    case unreachable
    case invalidResponse(_ error: String)
    case notFound(code: Int)
    case forbidden(code: Int)
    case badRequest(code: Int)
    case serverError(code: Int)
    case unauthorized(code: Int)
}
