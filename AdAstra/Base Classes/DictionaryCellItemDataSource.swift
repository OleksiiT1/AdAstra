//
//  DictionaryCellItemDataSource.swift
//  AdAstra
//
//  Created by Oleksii Tiurenkov on 5/3/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

class DictionaryCellItemDataSource: CellDataSource {
    private var model: Codable?
    var keys: [CellItemDecoder] {
        return [CellItemDecoder]()
    }
    private var items: [CellItem] = []

    var count: Int {
        return model == nil ? 0 : items.count
    }

    func at(_ index: Int) -> CellItem {
        guard index < items.count else {
            return .oneLine("N/A")
        }
        return items[index]
    }

    func prefetch(_ indexes: [Int]) {}

    func set(model: Codable) {
        self.model = model
        for key in keys {
            let items = key.getCellItem(from: model)
            self.items.append(contentsOf: items)
        }
        
    }
}
