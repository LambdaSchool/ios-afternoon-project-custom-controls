//
//  ViewController.swift
//  StarRating
//
//  Created by John Kouris on 9/26/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Rating: \(CustomControl.value) stars"
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
    }
    
}

