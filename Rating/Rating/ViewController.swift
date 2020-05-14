//
//  ViewController.swift
//  Rating
//
//  Created by Dahna on 5/14/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        if ratingControl.value == 1 {
            navigationItem.title = "User Rating: 1 Star"
        } else {
            navigationItem.title = "User Rating: \(ratingControl.value) Stars"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

