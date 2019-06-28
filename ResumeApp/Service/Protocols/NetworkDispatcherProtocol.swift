//
//  NetworkDispatcherProtocol.swift
//  ResumeApp
//
//  Created by Oliver Jordy Perez Escamilla on 6/20/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import Foundation

/// Describes the requirements to resquest data from the service
protocol NetworkDispatcher {
    func dispatch(onSuccess: @escaping (Data) -> Void, onError: @escaping (ServiceError) -> Void)
}
