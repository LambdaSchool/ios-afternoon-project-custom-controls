//
//  ViewController.swift
//  StarRater
//
//  Created by Thomas Sabino-Benowitz on 11/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ControlViewController: UIViewController {
    
    let customControl = CustomControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
    
        self.title = "User Rating: \(ratingControl.value) stars"
    }
    

    
}

