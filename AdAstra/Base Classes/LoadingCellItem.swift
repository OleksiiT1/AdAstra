//
//  LoadingCellItem.swift
//  AdAstra
//
//  Created by Oleksii Tiurenkov on 4/22/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

class LoadingCellItem: CellItem {
    var cellIdentifier: String {
        return R.reuseIdentifier.loadingTableViewCell.identifier
    }
}
