//
//  URLs+CellItem.swift
//  AdAstra
//
//  Created by Oleksii Tiurenkov on 5/3/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

protocol AccaptableToShow {}

extension URL: AccaptableToShow{}


extension Array: CellItem where Element == AccaptableToShow {
    var cellIdentifier: String {
        return R.nib.oneLabelTableCell.identifier
    }
}

extension Array: TextCellItem where Element == URL {
    var name: String {
        return "Items"
    }
}

extension URL: TextCellItem {
    var name: String {
        return self.absoluteString
    }
    
}
