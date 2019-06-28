//
//  ServiceError.swift
//  ResumeApp
//
//  Created by Oliver Jordy Perez Escamilla on 6/20/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import Foundation

/// The posible service error cases
enum ServiceError: Error {
    case responseError
    case invalidURL
    case noData
    case invalidData
}
