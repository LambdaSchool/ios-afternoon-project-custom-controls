//
//  ViewController.swift
//  RatingCustomControl
//
//  Created by Nick Nguyen on 2/20/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func updateRating(_ ratingControl: CustomControl) {
        title = ratingControl.value == 1 ? "User Rating : \(ratingControl.value) star" : "User Rating : \(ratingControl.value) stars"
    }
    
    
    
}

