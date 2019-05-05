//
//  Launches+RawCellData.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/28/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

extension Launches: RawCellData {
    var content: [CellItem] {
        return launches.map { CellItem.twoLines($0)}
    }
}
