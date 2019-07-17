//
//  ViewController.swift
//  Star Rating
//
//  Created by Nathan Hedgeman on 7/16/19.
//  Copyright © 2019 Nate Hedgeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        if ratingControl.value == 1 {
            
        self.title = "User Rating: \(ratingControl.value) Star"
            
        } else {
            
            self.title = "User Rating: \(ratingControl.value) Stars"
            
        }
    }
}

