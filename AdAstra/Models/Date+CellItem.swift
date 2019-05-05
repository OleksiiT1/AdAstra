//
//  Date+CellItem.swift
//  AdAstra
//
//  Created by Oleksii Tiurenkov on 5/3/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

//extension Date: CellItem {
//    var cellIdentifier: String {
//        return R.nib.oneLabelTableCell.identifier
//    }
//}

extension Date: TextCellItem {
    var name: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy, MMMM, dd HH:mm:ss"

        return dateFormatter.string(from: self)
    }
}
