//
//  ViewController.swift
//  Star Rating
//
//  Created by David Wright on 2/5/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Actions

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        let rating = ratingControl.value
        let ratingUnits = (rating == 1) ? "star" : "stars"
        navigationController?.title = "User Rating: \(String(rating)) \(ratingUnits)"
    }
}
