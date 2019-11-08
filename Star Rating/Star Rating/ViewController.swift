//
//  ViewController.swift
//  Star Rating
//
//  Created by Jon Bash on 2019-11-07.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTitle(with: 1)
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        updateTitle(with: ratingControl.value)
    }
    
    func updateTitle(with rating: Int) {
        let starText = rating == 1 ? "star" : "stars"
        title = "User Rating: \(rating) \(starText)"
    }
}

