//  
//  ProductDetailViewController.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import UIKit
import RxSwift
import RxCocoa

class ProductDetailViewController: UIViewController {
    var viewModel: ProductDetailViewModel!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.setup()
        self.setupUI()
        self.setupBindings()
    }

    private func setupUI() {
        self.view.backgroundColor = R.color.background()!
    }

    private func setupBindings() {
        self.viewModel
            .titlePublished
            .bind(to: self.navigationItem.rx.title)
            .disposed(by: self.disposeBag)
    }
}
