//
//  ViewController.swift
//  Custom Control
//
//  Created by Wyatt Harrell on 3/19/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value > 1 {
            title = "\(ratingControl.value) stars"
        } else {
            title = "\(ratingControl.value) stars"
        }
    }

}

