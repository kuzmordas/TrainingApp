//
//  MainController.swift
//  TrainApp
//
//  Created by Aleksandr Kuznetsov on 27/04/2020.
//  Copyright © 2020 Aleksandr Kuznetsov. All rights reserved.
//

import UIKit
import Alamofire

class Currency {
    var type: String
    var amount: String
    var name: String
    
    init(type: String, amount: String, name: String) {
        self.type = type
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
                    let currencyItem = Currency(type: currency, amount: amount, name: name)
                    self.currencyData.append(currencyItem)
                }
                self.tableView.reloadData()
            case let .failure(error):
                print(error)
            }
        }
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.register(UINib(nibName: "RurCellView", bundle: nil), forCellReuseIdentifier: "RurCellView")
        tableView.register(UINib(nibName: "UsdCellView", bundle: nil), forCellReuseIdentifier: "UsdCellView")
        tableView.register(UINib(nibName: "EurCellView", bundle: nil), forCellReuseIdentifier: "EurCellView")
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
        
        if currency.type == "USD" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UsdCellView", for: indexPath) as! UsdCellController
            cell.nameLabelView?.text = currency.name
            cell.amountLabelView?.text = currency.amount
            return cell
        } else if currency.type == "RUR" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RurCellView", for: indexPath) as! RurCellController
            cell.nameLabelView?.text = currency.name
            cell.amountLabelView?.text = currency.amount
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EurCellView", for: indexPath) as! EurCellController
            cell.nameLabelView?.text = currency.name
            cell.amountLabelView?.text = currency.amount
            return cell
        }
    }
}
