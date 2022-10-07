//
//  NetworkEnvironment.swift
//  CountriesList
//
//  Created by Macbook on 10/03/2022.
//

import Foundation

typealias StatusCode = Int
let kTimeoutInterval: TimeInterval = 30.0
let kNetworkEnvironment: Environment = .development
let kRequestCachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalCacheData

enum Environment: String, CaseIterable {
    case beta
    case development
    case production
}

extension Environment {
    var baseURL: String {
        switch self {
        case .beta:
            return "https://restcountries.com"
        case .development:
            return "https://restcountries.com"
        case .production:
            return "https://restcountries.com"
        }
    }
}
