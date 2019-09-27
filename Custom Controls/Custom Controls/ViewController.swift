//
//  ViewController.swift
//  Custom Controls
//
//  Created by Eoin Lavery on 26/09/2019.
//  Copyright © 2019 Eoin Lavery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "User Rating: 1 Star"
        
    }
    
    //MARK: - IBActions
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        let currentRating = ratingControl.value
        
        if currentRating == 1 {
            title = "User Rating: \(currentRating) Star"
        } else {
            title = "User Rating: \(currentRating) Stars"
        }
        
    }


}

