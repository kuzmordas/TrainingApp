//
//  MainController.swift
//  TrainApp
//
//  Created by Aleksandr Kuznetsov on 27/04/2020.
//  Copyright © 2020 Aleksandr Kuznetsov. All rights reserved.
//

import UIKit
import Alamofire

class MainController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var currencyData: [Currency] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        Api.getCurrencies(success: { (respons) -> Void in
            self.currencyData = respons
            self.tableView.reloadData()
        })
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.register(UINib(nibName: "RurCellView", bundle: nil), forCellReuseIdentifier: "RurCellView")
        tableView.register(UINib(nibName: "UsdCellView", bundle: nil), forCellReuseIdentifier: "UsdCellView")
        tableView.register(UINib(nibName: "EurCellView", bundle: nil), forCellReuseIdentifier: "EurCellView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

}


extension MainController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currency = currencyData[indexPath.row]
        Api.getCurrencyDescription(id: currency.id, success: { (description) -> Void in
            let destination = AccountDetailsController(nibName: "AccountDetailsView", bundle: nil)
            currency.description = description
            destination.currencyData = currency
            self.navigationController?.pushViewController(destination, animated: true)
        })
        
    }
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
