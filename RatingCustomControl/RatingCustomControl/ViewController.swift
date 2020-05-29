//
//  ViewController.swift
//  RatingCustomControl
//
//  Created by Clayton Watkins on 5/28/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        let customControl = CustomControl()
        if customControl.value > 1 {
            self.navigationItem.title = "User Rating: \(customControl.value) stars"
        } else {
            self.navigationItem.title = "User Rating: \(customControl.value) star"
        }
    }
}

