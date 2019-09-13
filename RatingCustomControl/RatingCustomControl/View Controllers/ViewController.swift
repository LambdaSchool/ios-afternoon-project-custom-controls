//
//  ViewController.swift
//  RatingCustomControl
//
//  Created by Alex Rhodes on 9/12/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ratingChanged(_ ratingControl: RatingControl) {
        
        let N = ratingControl.value
        
        if N > 1 {
        navigationItem.title = "Rating: \(N) stars"
        } else {
            navigationItem.title = "Rating: \(N) star"
        }
    }
}

