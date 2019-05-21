//
//  ViewController.swift
//  UIControl
//
//  Created by Kobe McKee on 5/21/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        if ratingControl.value == 1 {
            navigationItem.title = "User Rating: \(ratingControl.value) Star"
        } else {
            navigationItem.title = "User Rating: \(ratingControl.value) Stars"
        }
        
    }
    

}
