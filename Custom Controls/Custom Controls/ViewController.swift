//
//  ViewController.swift
//  Custom Controls
//
//  Created by Dennis Rudolph on 11/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Choose a Rating"
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        switch ratingControl.value {
        case 1:
           self.title = "User Rating: \(ratingControl.value) star"
        default:
             self.title = "User Rating: \(ratingControl.value) stars"
        }
    }
}

