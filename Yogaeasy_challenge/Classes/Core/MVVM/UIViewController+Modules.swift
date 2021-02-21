//
//  UIViewController+Modules.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import UIKit

protocol ModuleInput: class {
    var moduleOutput: Any? { get set }
}

private struct ViewControllerModuleKeys {
    static var moduleInputKey = "UIViewControllerModuleInputKey"
    static var moduleOutputKey = "UIViewControllerModuleOutputKey"
}

extension UIViewController {
    var moduleInput: Any? {
        get { return objc_getAssociatedObject(self, &ViewControllerModuleKeys.moduleInputKey) }
        set { objc_setAssociatedObject(self, &ViewControllerModuleKeys.moduleInputKey, newValue, .OBJC_ASSOCIATION_ASSIGN) }
    }
    
    func configure<T>(_ moduleInputType: T.Type, completion: (T)->(Any?)) {
        guard let moduleInput = self.moduleInput as? T else { return }
        let moduleOutput = completion(moduleInput)
        (moduleInput as? ModuleInput)?.moduleOutput = moduleOutput
    }
}

extension ModuleInput {
    var moduleOutput: Any? {
        get { return objc_getAssociatedObject(self, &ViewControllerModuleKeys.moduleOutputKey) }
        set { objc_setAssociatedObject(self, &ViewControllerModuleKeys.moduleOutputKey, newValue, .OBJC_ASSOCIATION_ASSIGN) }
    }
}

