//
//  CellController.swift
//  TrainApp
//
//  Created by Aleksandr Kuznetsov on 29/04/2020.
//  Copyright © 2020 Aleksandr Kuznetsov. All rights reserved.
//

import UIKit

class RurCellController: UITableViewCell {
    
    @IBOutlet weak var nameLabelView: UILabel!
    @IBOutlet weak var amountLabelView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
