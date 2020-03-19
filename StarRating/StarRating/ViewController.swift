//
//  ViewController.swift
//  StarRating
//
//  Created by Shawn Gee on 3/19/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var starRatingControl: CustomControl!
    
    
    // MARK: - IBActions
    
    @IBAction func updateRating(_ sender: CustomControl) {
        title = "User Rating: \(sender.value) star\(sender.value > 1 ? "s" : "")"
    }
    
    @IBAction func rightToLeftToggled(_ sender: UISwitch) {
        starRatingControl.rightToLeft = sender.isOn
    }
}

