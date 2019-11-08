//
//  ViewController.swift
//  CustomControls
//
//  Created by BDawg on 11/7/19.
//  Copyright © 2019 Brandi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let customControl = CustomControl()

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        if ratingControl.value == 1 {
            self.title = "User Rating: \(ratingControl.value) Star"
        } else {
            self.title = "User Rating: \(ratingControl.value) Stars"
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

