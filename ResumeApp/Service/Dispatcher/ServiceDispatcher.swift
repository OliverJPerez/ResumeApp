//
//  NetworkDispatcher.swift
//  BindingsExample
//
//  Created by Oliver Jordy Perez Escamilla on 6/17/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import Foundation

// MARK: URLSessionNetworkDispatcher
struct ServiceDispatcher: NetworkDispatcher {
    
    // MARK: - Private properties
    private let session: URLSessionProtocol
    private let request: RequestData
    
    // MARK: - Initializers
    init(with session: URLSessionProtocol = URLSession.shared, request: RequestData) {
        self.session = session
        self.request = request
    }
    
    /// MARK: - Methods
    /// Dispatches the request using the request data
    ///
    /// - Parameters:
    ///   - session: Allows to inject a URLSessionProtocol for testing
    ///   - request: The request to perform
    ///   - onSuccess: Completion closure for success
    ///   - onError: Completion closure for error
    func dispatch(onSuccess: @escaping (Data) -> Void, onError: @escaping (ServiceError) -> Void) {
        guard let url = URL(string: request.path) else {
            onError(ServiceError.invalidURL)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                onError(ServiceError.responseError)
                return
            }

            guard let _data = data else {
                onError(ServiceError.noData)
                return
            }
            onSuccess(_data)
            }.resume()
    }
}
