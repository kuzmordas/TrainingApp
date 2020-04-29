//
//  MainController.swift
//  TrainApp
//
//  Created by Aleksandr Kuznetsov on 27/04/2020.
//  Copyright © 2020 Aleksandr Kuznetsov. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class Currency {
    var currency: String
    var amount: String
    var name: String
    
    init(currency: String, amount: String, name: String) {
        self.currency = currency
        self.amount = amount
        self.name = name
    }
}

class MainController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var currencyData: [Currency] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("http://109.229.239.222:10001/accounts").responseJSON { response in
            switch response.result {
            case let .success(value):
                let JSON = value as! NSDictionary
                let items = JSON.object(forKey: "items")! as! NSArray
                items.forEach { item in
                    let data = item as! NSDictionary
                    let currency = data.object(forKey: "currency")! as! String
                    let amount = data.object(forKey: "amount")! as! String
                    let name = data.object(forKey: "name")! as! String
                    let currencyItem = Currency(currency: currency, amount: amount, name: name)
                    self.currencyData.append(currencyItem)
                }
                self.tableView.reloadData()
            case let .failure(error):
                print(error)
            }
        }
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.register(UINib(nibName: "CellView", bundle: nil), forCellReuseIdentifier: "CellView")
    }

}


extension MainController: UITableViewDelegate {
    
}

extension MainController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currency = self.currencyData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellView", for: indexPath) as! CellController
        cell.nameLabel?.text = currency.name
        cell.sumLabel?.text = currency.amount
        return cell
    }
}
