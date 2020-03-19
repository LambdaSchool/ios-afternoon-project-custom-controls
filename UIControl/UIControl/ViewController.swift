//
//  ViewController.swift
//  UIControl
//
//  Created by Lydia Zhang on 3/19/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func rate(_ ratingControl: CustomControl) {
        title = "User rating: \(ratingControl.value) \(ratingControl.value == 1 ? "star" : "stars")"
    }
    

}

