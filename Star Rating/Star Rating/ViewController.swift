//
//  ViewController.swift
//  Star Rating
//
//  Created by Mark Gerrior on 3/19/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    

    // MARK: - Actions

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        let plural = ratingControl.value == 1 ? "" : "s"
        title = "User Rating: \(ratingControl.value) star\(plural)"
    }
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

