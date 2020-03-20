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
        updateTitle()
    }
    
    @IBAction func rightToLeftToggled(_ sender: UISwitch) {
        starRatingControl.rightToLeft = sender.isOn
    }
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTitle()
    }
    
    
    // MARK: - Private
    
    private func updateTitle() {
        title = "User Rating: \(starRatingControl.value) star\(starRatingControl.value > 1 ? "s" : "")"
    }
    
  
}

