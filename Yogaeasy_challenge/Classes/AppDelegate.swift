//
//  AppDelegate.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var viewControllerFactory: ViewControllerFactory!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Init assemblies
        ApplicationAssembler.assemble()
        
        // Resolve appDelegate dependencies
        ApplicationAssembler.resolve(appDelegate: self)
        
        // Setup a root view controller
        let productsController = self.viewControllerFactory.makeProductsViewController()
        let navigationController = self.viewControllerFactory
            .makeNavigationViewController(rootViewController: productsController)
        navigationController.navigationBar.isTranslucent = false
        
        // Setup a window and an initial view controller
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}

