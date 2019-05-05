//
//  BaseTableViewController.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/29/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewController: UITableViewController {

    var dataSource: CellDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.contentInsetAdjustmentBehavior = .scrollableAxes
        edgesForExtendedLayout = UIRectEdge.all
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        // Fix the tableview bottom part bar issue
        tableView.contentInset.bottom = self.tabBarController?.tabBar.frame.height ?? 0
        registerCells()
    }

    func registerCells() {}

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSource.at(indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath)
        if let cell = cell as? ConfigurableCell {
            cell.configure(item: item)
        }
        return cell
    }

    func update() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
