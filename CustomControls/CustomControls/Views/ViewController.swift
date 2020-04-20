//
//  ViewController.swift
//  CustomControls
//
//  Created by Matthew Martindale on 4/15/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        let rating = ratingControl.value
        self.title = rating == 1 ? "User Rating: 1 star" : "User Rating: \(rating) stars"
    }
    
}

