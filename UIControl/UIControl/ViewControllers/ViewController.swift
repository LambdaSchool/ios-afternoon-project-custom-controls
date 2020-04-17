//
//  ViewController.swift
//  UIControl
//
//  Created by Elizabeth Thomas on 4/16/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func updateRating(_ ratingControl: CustomControl) {
        title = "User Rating: \(ratingControl.value) stars"
    }
    
}

