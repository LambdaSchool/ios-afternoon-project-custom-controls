//
//  ViewController.swift
//  StarRating
//
//  Created by Aaron Cleveland on 1/28/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        var starsValue = "\(ratingControl.value) stars"
        if ratingControl.value == 1 {
            starsValue = "1 star"
        }
        
        self.title = "User Ratings: \(starsValue)"
    }
    
}
