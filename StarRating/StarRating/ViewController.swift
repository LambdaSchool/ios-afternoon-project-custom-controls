//
//  ViewController.swift
//  StarRating
//
//  Created by Gerardo Hernandez on 2/5/20.
//  Copyright © 2020 Gerardo Hernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        navigationItem.title = "UserRating: \(ratingControl.value) stars"
        
        if ratingControl.value > 1 {
            navigationItem.title = "UserRating: \(ratingControl.value) stars"
        } else {
            navigationItem.title = "UserRating: \(ratingControl.value) star"
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

