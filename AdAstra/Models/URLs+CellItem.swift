//
//  URLs+CellItem.swift
//  AdAstra
//
//  Created by Oleksii Tiurenkov on 5/3/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

extension Array: CellItem where Element == URL {
    var cellIdentifier: String {
        return R.nib.oneLabelTableCell.identifier
    }
}

extension Array: TextCellItem where Element == URL {
    var name: String {
        return "Items"
    }
}
