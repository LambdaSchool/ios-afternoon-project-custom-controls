//
//  ViewController.swift
//  StarRating
//
//  Created by Bradley Yin on 8/13/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ sender: CustomControl) {
        title = "User Rating: N stars"
    }
    
}

