//
//  NetworkingAssembly.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import Swinject
import SwinjectAutoregistration

class NetworkingAssembly: Assembly {
    func assemble(container: Container) {
        container
            .autoregister(YogaeasyAPIClient.self, initializer: YogaeasyAPIClient.init)
            .inObjectScope(.container)
    }
}
