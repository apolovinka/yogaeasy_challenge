//
//  UIImage+Extenstion.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import UIKit

extension UIImage {
    class func image(with color: UIColor, size: CGSize) -> UIImage? {
        let layer = CALayer()
        layer.frame = CGRect(origin: CGPoint.zero, size: size)
        layer.backgroundColor = color.cgColor
        let renderer = UIGraphicsImageRenderer(bounds: layer.frame)
        return renderer.image {
            layer.render(in: $0.cgContext)
        }
        .resizableImage(withCapInsets: UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch)
    }
}
