//
//  RawCellData.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/28/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

protocol RawCellData {
    var total: Int { get }
    var offset: Int { get }
    var count: Int { get }
    var content: [CellItem] { get }
}
