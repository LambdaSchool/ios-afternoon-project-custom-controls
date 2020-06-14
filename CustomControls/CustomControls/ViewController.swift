//
//  ViewController.swift
//  CustomControls
//
//  Created by Josh Kocsis on 5/28/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value <= 1 {
            title = "User Rating: \(ratingControl.value) star"
        } else {
            title = "User Rating: \(ratingControl.value) stars"
        }
    }
    
}

