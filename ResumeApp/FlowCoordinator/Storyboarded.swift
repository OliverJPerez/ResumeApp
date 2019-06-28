//
//  Storyboarded.swift
//  BindingsExample
//
//  Created by OliverPérez on 6/16/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import UIKit

// MARK: Storyboarded
/// Protocol that lets an easily creation of View Controllers from a storyboard.
protocol Storyboarded {
    /// Instantiates a type that conforms to this protocol from a storyboard.
    /// - Parameter storyboardName: The name of the storyboard from which to instantiate a conforming type.
    static func instantiate(from storyboardName: String) -> Self
}

// MARK: Storyboarded-ViewController
extension Storyboarded where Self: UIViewController {
    /// Instantiates a `UIViewController` or a subclass from a storyboard.
    /// - Parameter storyboardName: The name of the storyboard from which to instantiate the view controller.
    static func instantiate(from storyboardName: String) -> Self {
        let identifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        
        guard let controller = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError("The controller could not being instantiated from the storyboard with the given identifier")
        }
        
        return controller
    }
}

