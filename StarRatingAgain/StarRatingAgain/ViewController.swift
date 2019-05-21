//
//  ViewController.swift
//  StarRatingAgain
//
//  Created by Ryan Murphy on 5/21/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func updateRating(_ ratingControl: CustomController) {
        if ratingControl.value == 1 {
            navigationItem.title = "User Rating: \(ratingControl.value) star"
        } else {
            navigationItem.title = "User Rating: \(ratingControl.value) stars"
        }
    
    }
}

