//
//  ViewController.swift
//  Custom Control
//
//  Created by Wyatt Harrell on 3/19/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Rating: 1 Star"
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value > 1 {
            title = "User Rating: \(ratingControl.value) Stars"
        } else {
            title = "User Rating: \(ratingControl.value) Stars"
        }
    }

}

