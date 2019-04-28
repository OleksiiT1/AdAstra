//
//  CellDataSource.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/28/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

protocol CellDataSource {
    var count: Int { get }
    func at(_ index: Int) -> CellItem
    func prefetch(_ indexes: [Int])
}
