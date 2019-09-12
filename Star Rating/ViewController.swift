//
//  ViewController.swift
//  Star Rating
//
//  Created by Andrew Ruiz on 9/12/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let customControl = CustomControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        title = "User Rating: \(customControl.value) stars"
    }
}

