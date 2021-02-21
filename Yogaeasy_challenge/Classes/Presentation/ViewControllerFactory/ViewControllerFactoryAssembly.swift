//
//  ViewControllerFactoryAssembly.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import Swinject

class ViewControllerFactoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ViewControllerFactory.self) { resolver in
            ViewControllerFactory(resolver: resolver)
        }.inObjectScope(.container)
    }
}
