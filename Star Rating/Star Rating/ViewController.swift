//
//  ViewController.swift
//  Star Rating
//
//  Created by Vici Shaweddy on 9/26/19.
//  Copyright © 2019 Vici Shaweddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var customControl: CustomControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateRating(self.customControl)
        self.customControl.addTarget(self, action: #selector(updateRating(_:)), for: .valueChanged)
    }

    @objc
    func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
            self.navigationItem.title = "User Rating: 1 star"
        } else {
            self.navigationItem.title = "User Rating: \(ratingControl.value) stars"
        }
        
    }
    
}

