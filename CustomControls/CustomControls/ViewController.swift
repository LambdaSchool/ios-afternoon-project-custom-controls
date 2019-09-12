//
//  ViewController.swift
//  CustomControls
//
//  Created by Jordan Christensen on 9/13/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Rating: 0 stars"
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if (ratingControl.value == 1) {
            title = "User Rating: \(ratingControl.value) star"
        } else {
            title = "User Rating: \(ratingControl.value) stars"
        }
    }
    
}

