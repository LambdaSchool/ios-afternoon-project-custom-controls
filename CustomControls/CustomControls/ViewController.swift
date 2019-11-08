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
        navigationItem.title = "User Rating: \(customControl.value) stars"
    }
    
    // MARK: - Actions
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        // FIXME: - stars/star based on 1/or more
        print("hi")
        navigationItem.title = "User Rating: \(ratingControl.value) stars"
    }
    
}

