//
//  ViewController.swift
//  Ratings
//
//  Created by Niranjan Kumar on 11/7/19.
//  Copyright © 2019 Nar Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
            self.title = "User Rating: 1 Star"
        } else {
            self.title = "User Rating: \(ratingControl.value) Stars"
        }
    }
    

}

