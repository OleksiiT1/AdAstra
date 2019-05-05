//
//  LoadingTableViewCell.swift
//  AdAstra
//
//  Created by Oleksii Tiurenkov on 4/22/19.
//  Copyright © 2019 ovt. All rights reserved.
//

import UIKit

class LoadingTableViewCell: UITableViewCell, ConfigurableCell {

    @IBOutlet private weak var indicator: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        indicator.startAnimating()
    }
    
    func configure(item: CellItem) {
        indicator.startAnimating()
    }
}
