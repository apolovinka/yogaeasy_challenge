//
//  ProductCell.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import UIKit

class ProductCell: UITableViewCell {
    enum Action {
        case selected
    }

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var captionLabel: UILabel!
    
    var actionHandler: ((Action)->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.backgroundColor = R.color.background()!
        self.button.layer.cornerRadius = self.button.frame.height/2
        self.button.clipsToBounds = true
        self.button.setBackgroundImage(
            UIImage.image(with: R.color.primary200()!, size: .init(width: 1, height: 1)),
            for: .normal
        )
        self.button.setBackgroundImage(
            UIImage.image(with: R.color.primary100()!, size: .init(width: 1, height: 1)),
            for: .highlighted
        )
    }
    
    func configure(product: Product) {
        let title = "\(product.name) | \(product.price)"
        self.button.setTitle(title, for: .normal)
        self.captionLabel.text = product.description
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        self.actionHandler?(.selected)
    }
}
