//
//  ViewController.swift
//  StarCustomControl
//
//  Created by Lambda_School_Loaner_204 on 11/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "User Rating"
    }

    // MARK: - IBActions
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        title = "User Rating: \(ratingControl.value) starts"
    }
}

