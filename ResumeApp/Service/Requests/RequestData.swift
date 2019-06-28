//
//  RequestData.swift
//  BindingsExample
//
//  Created by Oliver Jordy Perez Escamilla on 6/17/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import Foundation

/// Describes the requirements to perform an http request
struct RequestData {
    
    // MARK: - Interface properties
    let path: String // The url path of the resource that we are requiring
    let method: HTTPMethod // The HTTP method (get, post, put, patch, delete, etc.)
    let params: [String: Any?]? // The body parameters in case it is needed
    let headers: [String: String]? // The request headers
    
    // MARK: - Initializers
    init (path: String,
          method: HTTPMethod = .get,
          params: [String: Any?]? = nil,
          headers: [String: String]? = nil) {
        self.path = path
        self.method = method
        self.params = params
        self.headers = headers
    }
}
