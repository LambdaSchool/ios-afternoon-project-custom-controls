//
//  ViewController.swift
//  Custom Controls
//
//  Created by Isaac Lyons on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        title = "User Rating: \(ratingControl.value) star\(ratingControl.value == 1 ? "" : "s")"
    }
    
}
