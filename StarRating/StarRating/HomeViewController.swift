//
//  HomeViewController.swift
//  StarRating
//
//  Created by Chad Parker on 4/16/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        title = "User Rating: \(ratingControl.value) star\(ratingControl.value == 0 ? "" : "s")"
    }
}
