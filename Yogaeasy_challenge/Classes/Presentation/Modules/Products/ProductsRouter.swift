//  
//  ProductsRouter.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import UIKit

class ProductsRouter {
    private weak var viewController: ProductsViewController!
    private let viewControllerFactory: ViewControllerFactory
    
    init(viewController: ProductsViewController, viewControllerFactory: ViewControllerFactory) {
        self.viewController = viewController
        self.viewControllerFactory = viewControllerFactory
    }
    
    func openProductDetail(product: Product) {
        let productDetailViewController = viewControllerFactory.makeProductDetailViewController()
        
        // Call cofigure() to pass the data to a viewModel of the ProductDetailModule
        productDetailViewController.configure(ProductDetailModuleInput.self) {
            input in
            input.configure(product: product)
        }
        self.viewController.navigationController?
            .pushViewController(productDetailViewController, animated: true)
    }
}
