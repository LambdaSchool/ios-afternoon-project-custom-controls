//
//  ViewController.swift
//  Star Rating
//
//  Created by Nathan Hedgeman on 8/13/19.
//  Copyright © 2019 Nate Hedgeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Rating: 1 star"
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        if ratingControl.value == 1 {
            title = "User Rating: \(ratingControl.value) star"
        } else {
            title = "User Rating: \(ratingControl.value) stars"
        }
        
    }
}





