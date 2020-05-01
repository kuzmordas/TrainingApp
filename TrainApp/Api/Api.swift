//
//  Api.swift
//  TrainApp
//
//  Created by Aleksandr Kuznetsov on 01/05/2020.
//  Copyright © 2020 Aleksandr Kuznetsov. All rights reserved.
//

import Foundation
import Alamofire

class Api {
    
    static let url: String = "http://109.229.239.222:10001"
    
    static func getCurrencies(success: @escaping (_ response:  [Currency]) -> Void) -> Void {
        AF.request(self.url + "/accounts").responseJSON { response in
            switch response.result {
            case let .success(value):
                let JSON = value as! NSDictionary
                let items = JSON.object(forKey: "items")! as! NSArray
                var result: [Currency] = []
                items.forEach { item in
                    let data = item as! NSDictionary
                    let id = data.object(forKey: "id")! as! String
                    let currency = data.object(forKey: "currency")! as! String
                    let amount = data.object(forKey: "amount")! as! String
                    let name = data.object(forKey: "name")! as! String
                    result.append(Currency(id: id, type: currency, amount: amount, name: name))
                }
                success(result)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    static func getCurrencyDescription(id: String, success: @escaping (_ response:  String) -> Void) -> Void {
        AF.request(self.url + "/accounts/" + id).responseJSON { response in
            switch response.result {
            case let .success(value):
                let JSON = value as! NSDictionary
                let description = JSON.object(forKey: "description")! as! String
                success(description)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    static func changeCurrencyName(id: String, newName: String, success: @escaping (_ response:  String) -> Void) -> Void {
        let body = ["name": newName]
        AF.request(self.url + "/accounts/" + id, method: .put, parameters: body, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case let .success(value):
                let JSON = value as! NSDictionary
                let name = JSON.object(forKey: "name")! as! String
                success(name)
            case let .failure(error):
                print(error)
            }
        }
    }
    
}
