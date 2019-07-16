//
//  ViewController.swift
//  Educat
//
//  Created by Ilya Mikheev on 12/07/2019.
//  Copyright © 2019 Ilya Mikheev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layer.insertSublayer(CAGradientLayer.gradient(.yellowCorall, forView: self.view), at: 0)
    }


}

