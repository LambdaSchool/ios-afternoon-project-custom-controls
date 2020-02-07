//
//  ViewController.swift
//  Star Rating
//
//  Created by Eoin Lavery on 07/02/2020.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    //MARK: - IBActions
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
            title = "User Rating: 1 Star"
        } else {
            title = "User Rating: \(ratingControl.value) Stars"
        }
    }
    
}

