//
//  RequestType.swift
//  BindingsExample
//
//  Created by Oliver Jordy Perez Escamilla on 6/17/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import Foundation

// MARK: RequestType
/// Associates a request with the matching response type implementing ‘Codable‘
protocol RequestType {
    associatedtype ResponseType: Codable
    var data: RequestData { get }
}

// MARK: RequestType extensions
extension RequestType {
    /// Allows the dispactcher to execute the requests
    ///
    /// - Parameters:
    ///   - session: Allows to inject a URLSessionProtocol for testing
    ///   - onSuccess: Completion closure for success
    ///   - onError: Completion closure for error
    func fetch (
        with session: URLSessionProtocol = URLSession.shared,
        onSuccess: @escaping (ResponseType) -> Void,
        onError: @escaping (ServiceError) -> Void) {
        // Executes the dispatcher with the given parameters
        ServiceDispatcher(with: session, request: self.data).dispatch(
                            onSuccess: { (responseData: Data) in
                                do {
                                    let jsonDecoder = JSONDecoder()
                                    let result = try jsonDecoder.decode(ResponseType.self, from: responseData)
                                    DispatchQueue.main.async {
                                        onSuccess(result)
                                    }
                                } catch {
                                    DispatchQueue.main.async {
                                        onError(ServiceError.invalidData)
                                    }
                                } },
                            onError: { error in
                                DispatchQueue.main.async {
                                    onError(error)
                                }
        })
    }
}

