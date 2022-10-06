//
//  NetworkManager.swift
//  CountriesList
//
//  Created by Macbook on 10/03/2022.
//

import Foundation
import UIKit

class NetworkManager: NSObject {

    // MARK: - Properties
    var task: URLSessionTask?
    var session: URLSession

    // MARK: - Initialization
    public override init() {
        session = URLSession.shared
    }
    public convenience init(_ configuration: URLSessionConfiguration = .default) {
        self.init()
        self.session = URLSession.init(configuration: configuration)
    }

    public convenience init(configuration: URLSessionConfiguration, delegateQueue: OperationQueue) {
        self.init()
        self.session = URLSession(configuration: configuration, delegate: self, delegateQueue: delegateQueue)
    }

    // MARK: - Request Method
    public func request<T: Decodable>(_ request: URLRequest, completionBlock: @escaping (Result<T, Error>) -> Void) {

        NetworkLogger.log(request: request)
        let completionOnMain: (Result<T, Error>) -> Void = { result in
            DispatchQueue.main.async {
                completionBlock(result)
            }
        }

        task = session.dataTask(with: request, completionHandler: {data, response, error in
            NetworkLogger.log(response: response)
            guard error == nil else {
                if let error = error {
                    NetworkLogger.log(error: error)
                    completionOnMain(.failure(NetworkErrorMapper.handleNetworkError(error).error))
                }
                return
            }

            guard let response = response as? HTTPURLResponse else {
                return completionOnMain(.failure(NetworkError.unknown(ErrorMessage.unknowError.rawValue)))
            }

            guard response.statusCode.isSuccess else {
                return completionOnMain(.failure(NetworkErrorMapper.mapNetworkError(response.statusCode).error))
            }

            guard let data = data else { return }
            do {
                let decodedResult = try JSONDecoder().decode(T.self, from: data)
                completionOnMain(.success(decodedResult))
            } catch {
                NetworkLogger.log(error: error)
                completionOnMain(.failure(NetworkErrorMapper.handleNetworkError(error).error))
            }
        })

        task?.resume()
    }

    public func invalidateSession() {
        session.invalidateAndCancel()
    }
}

extension NetworkManager: URLSessionTaskDelegate {
    func urlSession(
        _ session: URLSession,
        task: URLSessionTask,
        didSendBodyData bytesSent: Int64,
        totalBytesSent: Int64,
        totalBytesExpectedToSend: Int64
    ) {
        let progress = Double(totalBytesSent) / Double(totalBytesExpectedToSend)
        print("Progress: ", progress)
    }
}
