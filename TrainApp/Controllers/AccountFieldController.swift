//
//  AccountFieldController.swift
//  TrainApp
//
//  Created by Aleksandr Kuznetsov on 01/05/2020.
//  Copyright © 2020 Aleksandr Kuznetsov. All rights reserved.
//

import UIKit

class AccountFieldController: UIViewController {

    @IBOutlet weak var fieldNameLabel: UILabel!
    @IBOutlet weak var fieldValueLabel: UILabel!
    var fieldName: String?
    var fieldValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fieldNameLabel.text = fieldName
        fieldValueLabel.text = fieldValue
        self.view.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setField(key: String, value: String?) {
        fieldName = key
        fieldValue = value
    }
    
    func update(newValue: String) {
        fieldValue = newValue
        fieldValueLabel.text = newValue
    }
}
