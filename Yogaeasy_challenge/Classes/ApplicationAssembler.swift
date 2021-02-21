//
//  ApplicationAssembler.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import Swinject

class ApplicationAssembler {
    private static var assembler: Assembler?
    static let container = Container()
    
    class func assemble() {
        self.assembler = Assembler(container: self.container)
        
        // Provide all assembiles except modules
        self.assembler?.apply(assemblies: [
            ViewControllerFactoryAssembly(),
            ServicesAssembly(),
            NetworkingAssembly(),
        ])
        
        // Provide module assemblies
        self.assembler?.apply(assemblies: [
            ProductsModuleAssembly(),
            ProductDetailModuleAssembly(),
        ])
        
        // Disable default logging of a container
        Container.loggingFunction = nil
    }
    
    // Resolves appDelegate's dependencies
    class func resolve(appDelegate: AppDelegate) {
        appDelegate.viewControllerFactory = self.container.resolve(ViewControllerFactory.self)
    }
}
