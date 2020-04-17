//
//  ViewController.swift
//  UICustomControl
//
//  Created by Breena Greek on 4/16/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBAction
    @IBAction func updateRating(_ ratingControl: CustomControl) {
          if ratingControl.value == 1 {
                self.title = "User Rating: 1 star"
            } else {
                self.title = "User Rating: \(ratingControl.value) star"
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

