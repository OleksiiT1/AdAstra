//
//  String+CellItem.swift
//  AdAstra
//
//  Created by Oleksii Tiurenkov on 5/3/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

extension String: CellItem, TextCellItem {
    var cellIdentifier: String {
        return R.nib.oneLabelTableCell.identifier
    }

    var name: String {
        return self
    }

}


extension String: AccaptableToShow {}

//extension Array: CellItem where Element == String {
//    var cellIdentifier: String {
//        return R.nib.oneLabelTableCell.identifier
//    }
//    
//    var name: String {
//        return "N/A"
//    }
//    
//    
//}
