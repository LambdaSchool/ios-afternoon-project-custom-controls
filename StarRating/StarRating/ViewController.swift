//
//  RatingViewController.swift
//  StarRating
//
//  Created by Dojo on 8/1/20.
//  Copyright © 2020 Dojo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Actions
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        let rating = ratingControl.value
        let ratingUnits = (rating == 1) ? "star" : "stars"
        navigationItem.title = "User Rating: \(String(rating)) \(ratingUnits)"
    }
}
