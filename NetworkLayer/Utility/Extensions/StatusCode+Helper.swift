//
//  StatusCode+Helper.swift
//  CountriesList
//
//  Created by Macbook on 10/09/2022.
//

import Foundation

extension StatusCode {
    var isSuccess: Bool {
        (200..<300).contains(self)
    }
}
