//
//  AppDelegate.swift
//  BindingsExample
//
//  Created by OliverPérez on 6/14/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var flowCoordinator: FlowCoordinator? // The main flow coordinator
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Create the main navigation controller to be used for our app
        let navController = UINavigationController()
        // Send that into our coordinator so that it can display view controllers
        flowCoordinator = FlowCoordinator(navigationController: navController)
        // Tell the coordinator to take over control
        flowCoordinator?.start()
        // Create a basic UIWindow and activate it
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }
}

