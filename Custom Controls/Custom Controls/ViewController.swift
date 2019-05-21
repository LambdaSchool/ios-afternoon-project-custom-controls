//
//  ViewController.swift
//  Custom Controls
//
//  Created by Mitchell Budge on 5/21/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        var N = 1
        if N == 1 {
            title = "User Rating: 1 star"
        } else {
            title = "User Rating: \(N) stars"
        }
    }
}

