//
//  ConfigurableCell.swift
//  AdAstra
//
//  Created by Oleksii Tiurenkov on 4/22/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

protocol ConfigurableCell {
    func configure(item: CellItem)
}

extension ConfigurableCell {

    func configure(item: CellItem) {}
}
