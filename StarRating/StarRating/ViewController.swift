//
//  ViewController.swift
//  StarRating
//
//  Created by Shawn Gee on 3/19/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func updateRating(_ sender: CustomControl) {
        title = "User Rating: \(sender.value) star\(sender.value > 1 ? "s" : "")"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

