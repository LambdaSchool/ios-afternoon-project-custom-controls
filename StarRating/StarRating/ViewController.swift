//
//  ViewController.swift
//  StarRating
//
//  Created by Sameera Roussi on 5/14/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var customControl = CustomControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let star: String = customControl.value > 1 ?  "stars" : "star"
        self.navigationItem.title = "User Rating: \(customControl.value) \(star)"
    }

    // MARK: - Outlet
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        let star: String = customControl.value > 1 ?  "stars" : "star"
        self.navigationItem.title = "User Rating: \(customControl.value) \(star)"
    }
    
}

