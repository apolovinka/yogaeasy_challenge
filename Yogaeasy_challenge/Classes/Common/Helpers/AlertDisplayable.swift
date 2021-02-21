//
//  AlertDisplayable.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 21.02.21.
//

import UIKit

protocol AlertDisplayable {
    func presentErrorAlert(with message: String)
}

extension AlertDisplayable where Self: UIViewController {
    func presentErrorAlert(with message: String) {
        let title = "Error"
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss",
                                   style: .default,
                                   handler: nil)
        controller.addAction(action)
        self.present(controller, animated: true, completion: nil)
    }
}
