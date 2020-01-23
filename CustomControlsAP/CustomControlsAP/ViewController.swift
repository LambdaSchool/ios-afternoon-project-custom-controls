//
//  ViewController.swift
//  CustomControlsAP
//
//  Created by Jorge Alvarez on 1/23/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        print("updateRating fired")
        if ratingControl.value == 1 {
            title = "User Rating: \(ratingControl.value) star"
        } else {
            title = "User Rating: \(ratingControl.value) stars"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

