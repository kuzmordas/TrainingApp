//
//  LaunchController.swift
//  TrainApp
//
//  Created by Aleksandr Kuznetsov on 27/04/2020.
//  Copyright © 2020 Aleksandr Kuznetsov. All rights reserved.
//

import UIKit

class LaunchController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        let textLabel = createLabel(text: "Welcome to Training App")
        self.view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        setConstraints(subView: textLabel)
    }
    
    func createLabel(text: String) -> UILabel {
        let textLabel = UILabel()
        textLabel.textAlignment = .center
        textLabel.backgroundColor = .red
        textLabel.text = text
        return textLabel
    }
    
    func setConstraints(subView: UIView) {
        let screenSize: CGRect = UIScreen.main.bounds
        subView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            subView.widthAnchor.constraint(equalToConstant: screenSize.width),
            subView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
