//
//  ViewController.swift
//  Star Rating
//
//  Created by Alex Shillingford on 9/12/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
            self.title = "User Rating: N star"
        } else {
            self.title = "User Rating: N stars"
        }
    }
    
}

