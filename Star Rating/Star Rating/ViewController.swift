//
//  ViewController.swift
//  Star Rating
//
//  Created by Nichole Davidson on 3/19/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
            self.title = "User Rating: \(ratingControl.value) star"
        } else {
            self.title = "User Rating: \(ratingControl.value) stars"
        }
    }
}

