//
//  TwoLinedTableViewCell.swift
//  AdAstra
//
//  Created by Oleksii Tiurenkov on 5/5/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import UIKit

class TwoLinedTableViewCell: UITableViewCell, ConfigurableCell {

    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var secondaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(item: CellItem) {
        if let item = item as? TwoLinesItem {
            nameLabel.text = item.name
            secondaryLabel.text = item.subtile
        }
    }
    
}
