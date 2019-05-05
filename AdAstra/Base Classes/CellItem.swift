//
//  CellItem.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/28/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation
enum CellItem {

    case loading
    case oneLine(TextCellItem)
    case twoLines(TwoLinesItem)

    var cellIdentifier: String {
        switch self {
        case .oneLine:
            return R.nib.oneLabelTableCell.identifier
        case .twoLines:
            return R.nib.twoLinedTableViewCell.identifier
        case .loading:
            return R.nib.loadingTableViewCell.identifier
        }
    }

    var value: Any? {
        switch self {
        case .oneLine(let item):
            return item
        case .twoLines(let item):
            return item
        case .loading:
            return nil
        }
    }

}
