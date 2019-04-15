//
//  LaunchesTableViewController.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/15/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import UIKit

class LaunchesTableViewController: UITableViewController, LaunchesView {

    var presenter: LaunchesPresenter!
   
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
     
    //    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter.at(indexPath.row).name
        return cell
    }

    func update() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
