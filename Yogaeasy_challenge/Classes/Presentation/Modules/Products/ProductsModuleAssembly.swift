//  
//  ProductsModuleAssembly.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import Foundation
import Swinject

class ProductsModuleAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ProductsRouter.self) { (r, viewController: ProductsViewController) in
            return ProductsRouter(
                viewController: viewController,
                viewControllerFactory: r.resolve(ViewControllerFactory.self)!
            )
        }
        container.register(ProductsViewModel.self) { (r, viewController: ProductsViewController) in
            return ProductsViewModel(
                router: r.resolve(ProductsRouter.self, argument: viewController)!,
                productsService: r.resolve(ProductsService.self)!
            )
        }      
        container.register(ProductsViewController.self) { _ in ProductsViewController() }
            .initCompleted {
            r, viewController in
            viewController.viewModel = r.resolve(ProductsViewModel.self, argument: viewController)
            viewController.moduleInput = viewController.viewModel
        }
    }
}
