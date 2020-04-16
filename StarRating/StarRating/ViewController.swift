//
//  ViewController.swift
//  StarRating
//
//  Created by Chris Dobek on 4/16/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
           super.viewDidLoad()
       }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
            let rating = ratingControl.value
            let ratingUnits = (rating == 1) ? "star" : "stars"
            navigationItem.title = "User Rating: \(String(rating)) \(ratingUnits)"
        }
}


