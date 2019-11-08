//
//  ViewController.swift
//  CustomControls
//
//  Created by morse on 11/7/19.
//  Copyright © 2019 morse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let customControl = CustomControl()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateRating(customControl)
    }
    
    // MARK: - Actions
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        switch ratingControl.value {
        case 1: navigationItem.title = "User Rating: \(ratingControl.value) star"
        default: navigationItem.title = "User Rating: \(ratingControl.value) stars"
        }
    }
}

