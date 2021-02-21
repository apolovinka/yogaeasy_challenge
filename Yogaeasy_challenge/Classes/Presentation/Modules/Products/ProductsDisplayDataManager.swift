//
//  ProductsDisplayDataManager.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import UIKit

class ProductsDisplayDataManager: NSObject {
    enum Constants {
        static let cellIdentifier = "ProductCell"
    }
    enum Action {
        case selected(Int)
    }
    
    weak var tableView: UITableView!
    var actionHandler: ((Action)->Void)?
    
    private var items: [Product] = []
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        self.tableView.dataSource = self
        tableView.register(
            UINib(nibName: Constants.cellIdentifier, bundle: nil),
            forCellReuseIdentifier: Constants.cellIdentifier
        )
    }
    
    func set(items: [Product]) {
        self.items = items
        self.tableView.reloadData()
    }
}

extension ProductsDisplayDataManager: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) as? ProductCell else {
            return UITableViewCell()
        }
        cell.configure(product: self.items[indexPath.row])
        cell.actionHandler = {
            [unowned self] action in
            switch action {
            case .selected:
                self.actionHandler?(.selected(indexPath.row))
            }
        }
        return cell
    }
}


