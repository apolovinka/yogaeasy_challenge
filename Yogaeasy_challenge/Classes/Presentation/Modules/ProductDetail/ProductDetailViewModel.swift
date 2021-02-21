//  
//  ProductDetailViewModel.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import Foundation
import RxSwift
import RxRelay

protocol ProductDetailModuleInput: class {
    func configure(product: Product)
}

protocol ProductDetailModuleOutput {}

class ProductDetailViewModel: ProductDetailModuleInput {
    let titlePublished = BehaviorRelay(value: "")
    
    private let router: ProductDetailRouter!
    private let disposeBag = DisposeBag()
    private var product: Product?
    
    init(router: ProductDetailRouter) {
        self.router = router
    }

    // Module Input
    func configure (product: Product) {
        self.product = product
    }

    // View Input
    func setup() {
        self.titlePublished.accept(self.product?.name ?? "")
    }
}
