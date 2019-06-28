//
//  RequestImage.swift
//  ResumeApp
//
//  Created by Oliver Jordy Perez Escamilla on 6/18/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import Foundation

// MARK: RequestImage
protocol RequestImage {
    var rawData: RequestData { get }
}

extension RequestImage {
    /// Allows the dispactcher to download the image data
    ///
    /// - Parameters:
    ///   - session: Allows to inject a URLSessionProtocol for testing
    ///   - onSuccess: Completion closure for success
    ///   - onError: Completion closure for error
    func download (
        with session: URLSessionProtocol = URLSession.shared,
        onSuccess: @escaping (Data) -> Void,
        onError: @escaping (ServiceError) -> Void
        ) {
        
        // Executes the dispatcher with the given parameters
        ServiceDispatcher(with: session, request: self.rawData).dispatch(
                            onSuccess: { (responseData: Data) in
                                DispatchQueue.main.async {
                                    onSuccess(responseData)
                                } },
                            onError: { error in
                                DispatchQueue.main.async {
                                    onError(error)
                                }
        })
    }
}
