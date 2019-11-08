//
//  ViewController.swift
//  Custom Controls
//
//  Created by Dennis Rudolph on 11/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        self.title = "User Rating: \(ratingControl.value) star(s)"
    }
}

