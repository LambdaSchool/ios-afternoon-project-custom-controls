//
//  ViewController.swift
//  CustomControls
//
//  Created by Ciara Beitel on 9/12/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        navigationController?.title = "User Rating: \(ratingControl.value) \(ratingControl.value > 1 ? "stars": "star")"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

