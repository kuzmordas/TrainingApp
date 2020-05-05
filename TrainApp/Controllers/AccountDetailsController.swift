//
//  AccountDetailsController.swift
//  TrainApp
//
//  Created by Aleksandr Kuznetsov on 30/04/2020.
//  Copyright © 2020 Aleksandr Kuznetsov. All rights reserved.
//

import UIKit

class AccountDetailsController: UIViewController {
    
    @IBOutlet weak var textFieldView: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    var currencyData: Currency?
    var nameField: AccountFieldController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderFields()
    }
    
    private func renderFields() {
        self.nameField = AccountFieldController(nibName: "AccountFieldView", bundle: nil)
        self.nameField!.setField(key: "name", value: currencyData?.name)
        let typeField = AccountFieldController(nibName: "AccountFieldView", bundle: nil)
        typeField.setField(key: "type", value: currencyData?.type)
        let amountField = AccountFieldController(nibName: "AccountFieldView", bundle: nil)
        amountField.setField(key: "amount", value: currencyData?.amount)
        stackView.addArrangedSubview(self.nameField!.view)
        stackView.addArrangedSubview(typeField.view)
        stackView.addArrangedSubview(amountField.view)
        if currencyData?.details != nil {
            let descriptionField = AccountFieldController(nibName: "AccountFieldView", bundle: nil)
            descriptionField.setField(key: "description", value: currencyData?.details?.description)
            stackView.addArrangedSubview(descriptionField.view)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         self.view.endEditing(true)
    }
    
    @IBAction func changeName(_ sender: Any) {
        if textFieldView.text! != "" {
            Api.changeCurrencyName(id: currencyData!.id, newName: textFieldView.text!, success: { [weak self] (currency) -> Void in
                self?.currencyData!.name = currency.name
                self?.nameField!.update(newValue: currency.name)
                self?.textFieldView.text = ""
            })
        }
    }
}
