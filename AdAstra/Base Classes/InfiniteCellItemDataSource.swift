//
//  InfiniteCellItemDataSource.swift
//  AdAstra
//
//  Created by Aleksey Tyurenkov on 4/28/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation


class InfiniteCellItemDataSource: CellDataSource {
    private var items: [CellItem] = []
    private var didReachedEnd: Bool = false
    private var offset: Int = 0
    private var limit: Int = 20

    var count: Int {
        if items.isEmpty {
            return 0
        }
        return items.count + ( didReachedEnd ? 0 : 1 )
    }

    func at(_ index: Int) -> CellItem {
        if index < items.count {
            return items[index]
        }
        load(offset: offset, limit: limit)
        return LoadingCellItem()
    }

    func append(rawCellData: RawCellData) {
        offset = rawCellData.offset + rawCellData.count
        if offset >= rawCellData.total {
            didReachedEnd = true
        }
        items.append(contentsOf: rawCellData.content)
    }

    func prefetch(_ indexes: [Int]) {

    }

    func load(offset: Int, limit: Int) {}

}
