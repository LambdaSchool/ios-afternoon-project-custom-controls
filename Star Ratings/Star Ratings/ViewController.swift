//
//  ViewController.swift
//  Star Ratings
//
//  Created by Dillon P on 9/25/19.
//  Copyright © 2019 Lambda iOSPT2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
            self.title = "User Rating: 1 star"
        } else {
            self.title = "User Rating: \(ratingControl.value) stars"
        }
    }
    
    
    
}

