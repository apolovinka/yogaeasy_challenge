//  
//  ProductsViewController.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import UIKit
import RxSwift
import SnapKit

class ProductsViewController: UIViewController {
    enum Constants {
        static let rowHeight: CGFloat = 90.0
    }

    var viewModel: ProductsViewModel!
    let disposeBag = DisposeBag()
    
    private var activityIndicator: UIActivityIndicatorView!
    private var placeholderImageView: UIImageView!
    private var tableView: UITableView!
    private var displayDataManager: ProductsDisplayDataManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.setup()
        self.setupUI()
        self.setupBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.layoutTableView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { _ in
            self.layoutTableView()
        }, completion: nil)
    }
    
    // Layout tableview content to stick it to the bottom line
    private func layoutTableView() {
        let topContentInset = self.view.frame.height - Constants.rowHeight
            * CGFloat(self.viewModel.itemsPublished.value.count) - self.view.safeAreaInsets.bottom
        self.tableView.contentInset = UIEdgeInsets(top: topContentInset, left: 0, bottom: -self.view.safeAreaInsets.bottom, right: 0)
    }
    
    // MARK: Private

    private func setupUI() {
        self.navigationItem.title = self.viewModel.title
        
        // Create views
        self.createActivityIndicator()
        self.createTableView()
        
        // Layout views
        self.makeConstraints()
        
        // Create a manager that is responsible for handling a table view data
        self.displayDataManager = ProductsDisplayDataManager(tableView: self.tableView)
        self.displayDataManager.actionHandler = {
            [unowned self] action in
            switch action {
            case .selected(let index):
                self.viewModel.selectProduct(at: index)
            }
        }
    }

    private func setupBindings() {
        self.viewModel.itemsPublished
            .subscribe(onNext: {
                [unowned self] items in
                self.displayDataManager.set(items: items)
                self.layoutTableView()
            }).disposed(by: self.disposeBag)
        
        self.viewModel.errorPublished
            .subscribe(onNext: {
                [unowned self] error in
                self.presentErrorAlert(with: error.localizedDescription)
            }).disposed(by: self.disposeBag)
        
        self.viewModel.activityStatePublished
            .subscribe(onNext: {
                [unowned self] activityState in
                switch activityState {
                case .idle:
                    self.activityIndicator.stopAnimating()
                case .loading:
                    self.activityIndicator.startAnimating()
                }
            }).disposed(by: self.disposeBag)
    }
    
    // MARK: UI Configuration
    
    private func createActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.hidesWhenStopped = true
        self.view.addSubview(activityIndicator)
        self.activityIndicator = activityIndicator
    }
    
    private func createTableView() {
        let tableView = UITableView()
        tableView.rowHeight = Constants.rowHeight
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = R.color.background()!
        self.view.addSubview(tableView)
        if #available(iOS 13.0, *) {
            tableView.automaticallyAdjustsScrollIndicatorInsets = false
        } else {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        self.tableView = tableView
    }
    
    private func makeConstraints() {
        self.activityIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        self.tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}

extension ProductsViewController: AlertDisplayable {}
