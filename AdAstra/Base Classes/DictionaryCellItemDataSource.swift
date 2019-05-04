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
    
    var count: Int {
        return model == nil ? 0 : keys.count
    }
    
    func at(_ index: Int) -> CellItem {
        guard index < keys.count else {
            return "N/A"
        }
        guard let model = model else {
            return "N/A"
        }
        let key = keys[index]
        return key.getCellItem(from: model) ?? "N/A"
    }

    func prefetch(_ indexes: [Int]) {}
    
    func set(model: Codable) {
        self.model = model
    }
}
