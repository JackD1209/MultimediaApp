//
//  SettingsViewController.swift
//  MultimediaApp
//
//  Created by Doan Minh Hoang on 2/19/20.
//  Copyright © 2020 Doan Minh Hoang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
}
