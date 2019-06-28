//
//  Observable.swift
//  BindingsExample
//
//  Created by OliverPérez on 6/16/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import Foundation

/// Class designed to monitor one value, allows to bind objects using a decorator pattern
class Observable<T>{
    var valueChanged: ((T?) -> ())?
    
    public var value: T? {
        didSet{
            valueChanged?(value)
        }
    }
    init(_ value: T) {
        self.value = value
    }
}
