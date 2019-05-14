//
//  ViewController.swift
//  CustomControls-Rating
//
//  Created by Lisa Sampson on 5/14/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        let rating = ratingControl.value
        
        if rating > 1 {
            title = "User Rating: \(rating) stars"
        } else {
            title = "User Rating: \(rating) star"
        }
    }
    
}

