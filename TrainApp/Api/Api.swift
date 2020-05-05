//
//  Api.swift
//  TrainApp
//
//  Created by Aleksandr Kuznetsov on 01/05/2020.
//  Copyright © 2020 Aleksandr Kuznetsov. All rights reserved.
//

import Foundation
import Alamofire

let decoder = JSONDecoder()

func decodeModel<T : Codable>(_ model: T.Type, data: Data) -> T? {
    do {
        let result = try decoder.decode(model, from: data)
        return result
    } catch let error as NSError {
        print(error)
        return nil
    }
}

class Api {
    
    static let url: String = "http://109.229.239.222:10001"
    
    static func getCurrencies(success: @escaping (_ response:  [Currency]) -> Void) -> Void {
        AF.request(self.url + "/accounts").responseJSON { response in
            switch response.result {
                case .success:
                    guard let result = decodeModel(CurrencyResponse.self, data: response.data!) else { return }
                    success(result.items)
                case let .failure(error):
                    print(error)
            }
        }
    }
    
    static func getCurrencyDescription(id: String, success: @escaping (_ response:  CurrencyDetails) -> Void) -> Void {
        AF.request(self.url + "/accounts/" + id).responseJSON { response in
            switch response.result {
                case .success:
                    guard let result = decodeModel(CurrencyDetails.self, data: response.data!) else { return }
                    success(result)
                case let .failure(error):
                    print(error)
            }
        }
    }
    
    static func changeCurrencyName(id: String, newName: String, success: @escaping (_ response:  Currency) -> Void) -> Void {
        let body = ["name": newName]
        AF.request(self.url + "/accounts/" + id, method: .put, parameters: body, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
                case .success:
                    guard let result = decodeModel(Currency.self, data: response.data!) else { return }
                    success(result)
                case let .failure(error):
                    print(error)
            }
        }
    }
    
}
