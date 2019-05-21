//
//  ViewController.swift
//  User Ratings
//
//  Created by Jonathan Ferrer on 5/21/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Give a User Rating"
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
        navigationItem.title = "User Rating: \(ratingControl.value) star"
        } else {
            navigationItem.title = "User Rating: \(ratingControl.value) stars"
        }
    }

}




