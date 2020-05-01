//
//  CurrencyModel.swift
//  TrainApp
//
//  Created by Aleksandr Kuznetsov on 30/04/2020.
//  Copyright © 2020 Aleksandr Kuznetsov. All rights reserved.
//

import Foundation

class Currency {
    var id: String
    var type: String
    var amount: String
    var name: String
    var description: String?
    
    init(id: String, type: String, amount: String, name: String) {
        self.id = id
        self.type = type
        self.amount = amount
        self.name = name
    }
}
