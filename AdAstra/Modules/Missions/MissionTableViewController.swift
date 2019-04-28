//
//  MissionTableViewController.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/15/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import UIKit

class MissionTableViewController: UITableViewController, MissionView {

    var presenter: MissionPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        automaticallyAdjustsScrollViewInsets = false
        edgesForExtendedLayout = UIRectEdge.all
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        // Fix the tableview bottom part bar issue
        tableView.contentInset.bottom = self.tabBarController?.tabBar.frame.height ?? 0
        tableView.register(R.nib.launchCellTableViewCell)
        tableView.register(R.nib.loadingTableViewCell)
        presenter.viewIsLoaded(self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = presenter.at(indexPath.row)
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
