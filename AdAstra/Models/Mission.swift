//
//  Mission.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/28/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

struct Mission: Codable {
    var id: Int
    var name: String
    //var net: String
    //    var lsp: String
}

extension Mission: CellItem {
    var cellIdentifier: String {
        return R.nib.oneLabelTableCell.identifier
    }
}

extension Mission: TextCellItem {

}
