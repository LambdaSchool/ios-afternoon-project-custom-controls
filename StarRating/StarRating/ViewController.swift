//
//  ViewController.swift
//  StarRating
//
//  Created by Nonye on 5/14/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit

@IBDesignable
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    //MARK:  - UPDATE RATING ACTION
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
            self.title = "User Rating: \(ratingControl.value) star"
        } else {
            self.title = "User Rating: \(ratingControl.value) stars"
        }
    
    }
    
}

