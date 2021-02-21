//
//  ServicesAssembly.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import Swinject

class ServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ProductsService.self) { r in
            ProductsService(networkingClient: r.resolve(YogaeasyAPIClient.self)!)
        }.inObjectScope(.container)
    }
}
