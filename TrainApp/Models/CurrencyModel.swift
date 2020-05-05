//
//  CurrencyModel.swift
//  TrainApp
//
//  Created by Aleksandr Kuznetsov on 30/04/2020.
//  Copyright © 2020 Aleksandr Kuznetsov. All rights reserved.
//

import Foundation

class Currency : Codable {
    var id: String
    var type: String
    var amount: String
    var number: String
    var name: String
    var details: CurrencyDetails?
    
    enum CodingKeys: String, CodingKey {
      case id, amount, number, name, type = "currency"
    }
}

class CurrencyDetails : Codable {
    var description: String
}

class CurrencyResponse : Codable {
    var items: [Currency]
}
