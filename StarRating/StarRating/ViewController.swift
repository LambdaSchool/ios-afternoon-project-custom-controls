//
//  ViewController.swift
//  StarRating
//
//  Created by Tobi Kuyoro on 20/02/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
            title = "User Rating: \(ratingControl.value) star"
        } else {
            title = "User Rating: \(ratingControl.value) stars"
        }
    }
}

