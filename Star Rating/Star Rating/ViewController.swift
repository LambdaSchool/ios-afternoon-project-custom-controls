//
//  ViewController.swift
//  Star Rating
//
//  Created by Michael Stoffer on 6/8/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        let text = ratingControl.value == 1 ? "User Rating: \(ratingControl.value) star" : "User Rating: \(ratingControl.value) stars"
        self.title = text
    }
    
}
