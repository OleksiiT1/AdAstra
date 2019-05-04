//
//  MissionTableViewController.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/15/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import UIKit

class MissionTableViewController: BaseTableViewController, MissionView {

    var presenter: MissionPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsLoaded(self)
    }

    override func registerCells() {
        tableView.register(R.nib.oneLabelTableCell)
        tableView.register(R.nib.loadingTableViewCell)
    }
}
