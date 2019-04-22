//
//  LaunchesCell+ConfigurableCell.swift
//  AdAstra
//
//  Created by Oleksii Tiurenkov on 4/22/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import Foundation

extension LaunchCellTableViewCell: ConfigurableCell {
    func configure(item: CellItem) {
        guard let item = item as? Launch else { return }
        mailLabel.text = item.name
    }
}
