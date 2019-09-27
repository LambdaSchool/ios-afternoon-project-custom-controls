//
//  ViewController.swift
//  Star Rating
//
//  Created by Joel Groomer on 9/26/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        var titleString = "User Rating: \(ratingControl.value) "
        titleString += ratingControl == 1 ? "star" : "stars"
        title = titleString
    }
    
}

