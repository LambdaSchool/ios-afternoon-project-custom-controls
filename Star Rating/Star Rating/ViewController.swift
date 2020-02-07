//
//  ViewController.swift
//  Star Rating
//
//  Created by Sal Amer on 2/6/20.
//  Copyright © 2020 Sal Amer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var customControl: CustomControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
//        self.navigationItem.title = ("User Rating: \(customControl.value) Stars")
        if ratingControl.value > 1 {
            title = "User Rating: \(ratingControl.value) Stars"
        } else {
            title = "User Rating: \(ratingControl.value) Star"
        }
    }
    
}

