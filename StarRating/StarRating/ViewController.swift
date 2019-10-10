//
//  ViewController.swift
//  StarRating
//
//  Created by Gi Pyo Kim on 10/10/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Rating: 1 star"
    }
    
    @IBAction func updateRating(_ sender: CustomControl) {
        title = sender.value > 1 ? "User Rating: \(sender.value) stars" : "User Rating: \(sender.value) star"
    }
}

