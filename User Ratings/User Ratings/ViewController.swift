//
//  ViewController.swift
//  User Ratings
//
//  Created by Jonathan Ferrer on 5/21/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {

        navigationController?.title = "User Rating: \(ratingControl.value) stars"
    }

}

