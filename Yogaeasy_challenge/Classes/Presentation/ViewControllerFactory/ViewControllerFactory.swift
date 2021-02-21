//
//  ViewControllerFactory.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import Foundation
import Swinject

class ViewControllerFactory {
    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func makeNavigationViewController(rootViewController: UIViewController) -> UINavigationController {
        UINavigationController(rootViewController: rootViewController)
    }
    
    func makeProductsViewController() -> ProductsViewController {
        resolver.resolve(ProductsViewController.self)!
    }
    
    func makeProductDetailViewController() -> ProductDetailViewController {
        resolver.resolve(ProductDetailViewController.self)!
    }
}
