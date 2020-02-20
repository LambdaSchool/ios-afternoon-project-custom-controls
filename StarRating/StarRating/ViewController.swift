//
//  ViewController.swift
//  StarRating
//
//  Created by Enrique Gongora on 2/20/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        let rating = ratingControl.value
        let ratingUnits = (rating == 1) ? "star" : "stars"
        navigationItem.title = "User Rating: \(String(rating)) \(ratingUnits)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

