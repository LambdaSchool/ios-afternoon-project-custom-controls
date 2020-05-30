//
//  ViewController.swift
//  StarRating
//
//  Created by Kenneth Jones on 5/29/20.
//  Copyright © 2020 Kenneth Jones. All rights reserved.
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

