//
//  ViewController.swift
//  CustomControls
//
//  Created by Matthew Martindale on 4/15/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        self.title = "User Rating: N stars"
    }
    
}

