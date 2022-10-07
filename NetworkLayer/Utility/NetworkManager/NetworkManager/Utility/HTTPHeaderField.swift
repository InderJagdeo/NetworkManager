//
//  HTTPHeaderField.swift
//  CountriesList
//
//  Created by Macbook on 17/08/2022.
//

import Foundation

enum HTTPHeaderField: String {
    case acceptType = "Accept"
    case contentType = "Content-Type"
    case authentication = "Authorization"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
