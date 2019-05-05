//
//  LaunchTableViewController.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/28/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation
import UIKit

class LaunchTableViewController: BaseTableViewController, LaunchView {

    var presenter: LaunchPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsLoaded(self)
    }

    override func registerCells() {
        tableView.register(R.nib.oneLabelTableCell)
        tableView.register(R.nib.loadingTableViewCell)
    }
}
