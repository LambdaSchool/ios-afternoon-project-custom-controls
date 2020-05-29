//
//  ViewController.swift
//  RatingCustomControl
//
//  Created by Clayton Watkins on 5/28/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value > 1 {
            self.navigationItem.title = "User Rating: \(ratingControl.value) Stars"
        } else {
            self.navigationItem.title = "User Rating: \(ratingControl.value) Star"
        }
    }
}

