//
//  ViewController.swift
//  CustomControls
//
//  Created by Angelique Abacajan on 1/23/20.
//  Copyright © 2020 Angelique Abacajan. All rights reserved.
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

