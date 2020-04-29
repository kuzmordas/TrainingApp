//
//  CellController.swift
//  TrainApp
//
//  Created by Aleksandr Kuznetsov on 29/04/2020.
//  Copyright © 2020 Aleksandr Kuznetsov. All rights reserved.
//

import UIKit

class CellController: UITableViewCell {
    
    @IBOutlet weak var stackView: UIStackView!
    var nameLabel: UILabel?
    var sumLabel: UILabel?
    var currencyImage: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        render()
    }
    
    func render() {
        let image = UIImage(named: "dollar")
        self.currencyImage = UIImageView(image: image)
        self.currencyImage!.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.nameLabel = createLabel("")
        self.sumLabel = createLabel("")
        self.stackView.addArrangedSubview(self.sumLabel!)
        self.stackView.addArrangedSubview(self.currencyImage!)
        self.stackView.addArrangedSubview(self.nameLabel!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func createLabel(_ text: String) -> UILabel {
        let textLabel = UILabel()
        textLabel.textAlignment = .center
        textLabel.text = text
        return textLabel
    }
}
