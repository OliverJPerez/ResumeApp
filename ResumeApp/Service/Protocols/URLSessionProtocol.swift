//
//  Protocols.swift
//  BindingsExample
//
//  Created by Oliver Jordy Perez Escamilla on 6/17/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import Foundation

// MARK: URLSessionProtocol
/// Protocol to allow to mock a URLSession in the unit tests
public protocol URLSessionProtocol {
    func dataTask(with urlRequest: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

// MARK: - Extension to make URLSesssion testable
extension URLSession: URLSessionProtocol { }
