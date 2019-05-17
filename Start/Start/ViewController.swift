//
//  ViewController.swift
//  Start
//
//  Created by Christopher Aronson on 5/14/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
            navigationItem.title = "User Rating: 1 star"
        } else {
            navigationItem.title = "User Rating: \(ratingControl.value) stars"
        }
    }
}

