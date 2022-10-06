//
//  Country.swift
//  NetworkLayer
//
//  Created by Macbook on 06/10/22.
//

import Foundation

struct Country: Decodable {
    let name: CountryName
    let region: String
    let population: Int
}

struct CountryName: Decodable {
    let common: String
}
