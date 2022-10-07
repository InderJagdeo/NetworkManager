//
//  NetworkErrorMessage.swift
//  CountriesList
//
//  Created by Macbook on 06/10/22.
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidUrl = "Invalid Url"
    case serverError = "Server Error"
    case unknowError = "Unknow Error"
    case unauthorized = "Unauthorized User"
    case invalidRequest = "Invalid Request"
    case invalidResponse = "Invalid response"
    case parametersNil = "Parameters were nil"
    case invalidStatusCode = "Invalid Status Code"
    case forbidden = "Request is refused by server"
    case encodingFailed = "Parameter encoding failed"
    case serverNotFound = "Server not found the request url"
    case unreachable = "Please check your network connection."
}
