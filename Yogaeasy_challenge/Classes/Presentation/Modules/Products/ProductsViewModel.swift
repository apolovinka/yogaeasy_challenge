//  
//  ProductsViewModel.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import Foundation
import RxSwift
import RxRelay

protocol ProductsModuleInput: class {}

protocol ProductsModuleOutput {}

class ProductsViewModel: ProductsModuleInput {
    enum ActivityState {
        case idle
        case loading
    }

    let title = "Products"
    
    let itemsPublished = BehaviorRelay<[Product]>(value: [])
    let errorPublished = PublishRelay<Error>()
    let activityStatePublished = BehaviorRelay(value: ActivityState.idle)
    
    private let router: ProductsRouter!
    private let productsService: ProductsService
    private let disposeBag = DisposeBag()
    
    init(router: ProductsRouter, productsService: ProductsService) {
        self.router = router
        self.productsService = productsService
    }

    // View Input
    func setup() {
        self.fetchProducts()
    }
    
    func selectProduct(at index: Int) {
        self.router.openProductDetail(product: self.itemsPublished.value[index])
    }
    
    // MARK: Private
    
    private func fetchProducts() {
        self.activityStatePublished.accept(.loading)
        self.productsService.fetchProducts {
            result in
            switch result {
            case .success(let products):
                self.itemsPublished.accept(products)
            case .failure(let error):
                self.errorPublished.accept(error)
            }
            self.activityStatePublished.accept(.idle)
        }
    }
}
