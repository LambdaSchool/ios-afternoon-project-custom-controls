//
//  ViewController.swift
//  Custom Controls
//
//  Created by Casualty on 9/26/19.
//  Copyright © 2019 Thomas Dye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        if ratingControl.value == 1 {
            navigationItem.title = "User Rating - 1 Star"
        } else if ratingControl.value == 5 {
            navigationItem.title = "User Rating - \(ratingControl.value) Stars =D"
        } else {
            navigationItem.title = "User Rating - \(ratingControl.value) Stars"
        }
    }
}

