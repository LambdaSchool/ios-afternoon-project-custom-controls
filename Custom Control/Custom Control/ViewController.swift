//
//  ViewController.swift
//  Custom Control
//
//  Created by Hayden Hastings on 5/21/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
            navigationItem.title = "User Rating: \(ratingControl.value) Star"
        } else {
            navigationItem.title = "User Rating: \(ratingControl.value) Stars"
        }
    }
}

