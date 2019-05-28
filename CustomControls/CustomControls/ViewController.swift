//
//  ViewController.swift
//  CustomControls
//
//  Created by Thomas Cacciatore on 5/28/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func updateRating(_ ratingControl: CustomControl) {
        let N = ratingControl.value
        if N == 1 {
            navigationController?.title = "User Rating: \(N) star"
        } else {
        navigationController?.title = "User Rating: \(N) stars"
        }
    }
}


