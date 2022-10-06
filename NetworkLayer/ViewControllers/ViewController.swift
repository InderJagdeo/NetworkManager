//
//  ViewController.swift
//  NetworkLayer
//
//  Created by Macbook on 19/04/2022.
//

import UIKit
import Combine

class ViewController: UIViewController {

    // MARK: - Properties
    private var networkManager = NetworkManager()

    // MARK: - UIView Methods
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        requestCountriesList()
    }
}

extension ViewController {
    // MARK: - Web Requests
    private func requestCountriesList() {
        do {
            let request = try Router.all.requestURL()
            networkManager.request(request) { (result: Result<[Country], Error>) in
                switch result {
                case .success(let countries):
                    print("Number of Countries: ", countries.count)
                case .failure(let error):
                    if let error = error as? NetworkError {
                        let message = ErrorMapper(error: error).message
                        print(message)
                    } else {
                        print(error)
                    }
                }

            }
        } catch {
            print("Errors: \(error)")
        }
    }
}
