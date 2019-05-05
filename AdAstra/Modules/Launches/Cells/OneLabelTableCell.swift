//
//  LaunchCellTableViewCell.swift
//  AdAstra
//
//  Created by Oleksii Tiurenkov on 4/22/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import UIKit

class OneLabelTableCell: UITableViewCell {

    @IBOutlet fileprivate weak var mailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension OneLabelTableCell: ConfigurableCell {
    func configure(item: CellItem) {
        if let item = item as? TextCellItem {
            mailLabel.text = item.name
        }
    }
}