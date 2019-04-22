//
//  Launch+CellItem.swift
//  AdAstra
//
//  Created by Oleksii Tiurenkov on 4/22/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation


extension Launch: CellItem {
    var cellIdentifier: String {
        return R.nib.launchCellTableViewCell.identifier
    }
}

