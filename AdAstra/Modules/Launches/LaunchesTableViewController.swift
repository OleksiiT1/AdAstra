//
//  LaunchesTableViewController.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/15/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import UIKit

class LaunchesTableViewController: BaseTableViewController, LaunchesView {

    var presenter: LaunchesPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsLoaded(self)
    }

    // MARK: - Table view data source
    override func registerCells() {
        tableView.register(R.nib.oneLabelTableCell)
        tableView.register(R.nib.loadingTableViewCell)
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.selected(index: indexPath.row)
    }
}
