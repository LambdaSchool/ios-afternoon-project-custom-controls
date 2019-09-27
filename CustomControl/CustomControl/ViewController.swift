//
//  ViewController.swift
//  CustomControl
//
//  Created by Jessie Ann Griffin on 9/26/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value > 1 {
            self.title = "User Rating: \(ratingControl.value) stars"
        } else {
            self.title = "User Rating: \(ratingControl.value) star"
        }
    }
}

