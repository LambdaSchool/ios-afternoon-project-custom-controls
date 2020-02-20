//
//  ViewController.swift
//  StarRating
//
//  Created by Chris Gonzales on 2/20/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
    @IBAction func customCell(_ sender: CustomControl) {

        if sender.value == 1 {
            self.title = "User Rating: \(sender.value) star"
            } else {
            self.title = "User Rating: \(sender.value) stars"
            }
    }
    
}
