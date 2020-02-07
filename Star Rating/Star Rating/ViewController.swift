//
//  ViewController.swift
//  Star Rating
//
//  Created by Joshua Rutkowski on 2/6/20.
//  Copyright © 2020 Josh Rutkowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let customControl = CustomControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateRating(customControl)
    }


    @IBAction func updateRating(_ ratingControl: CustomControl) {
        navigationItem.title = "User Rating: \(ratingControl.value) stars"
    }
    
    
}

