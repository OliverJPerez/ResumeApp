//
//  CoordinatorInterface.swift
//  BindingsExample
//
//  Created by OliverPérez on 6/16/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//
import UIKit

/// MARK: FlowCoordinatorInterface
/// The required interface of a flow coordinator
protocol FlowCoordinatorInterface {
    // MARK: Properties
    var childCoordinators: [FlowCoordinator] { get set }
    var navigationController: UINavigationController { get set }
    /// Initial configuration
    func start()
}
