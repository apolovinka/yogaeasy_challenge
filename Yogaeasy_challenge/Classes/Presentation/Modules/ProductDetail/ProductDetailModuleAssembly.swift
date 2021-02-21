//  
//  ProductDetailModuleAssembly.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import Foundation
import Swinject

class ProductDetailModuleAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ProductDetailRouter.self) { (r, viewController: ProductDetailViewController) in
            return ProductDetailRouter(viewController: viewController)
        }
        container.register(ProductDetailViewModel.self) { (r, viewController: ProductDetailViewController) in
            return ProductDetailViewModel(router: r.resolve(ProductDetailRouter.self, argument: viewController)!)
        }      
        container.register(ProductDetailViewController.self) { _ in ProductDetailViewController() }
            .initCompleted {
            r, viewController in
            viewController.viewModel = r.resolve(ProductDetailViewModel.self, argument: viewController)
            viewController.moduleInput = viewController.viewModel
        }
    }
}
