//
//  ViewController.swift
//  Star Rating
//
//  Created by Ufuk Türközü on 23.01.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        switch ratingControl.value {
        case 1:
            self.title = "User Rating: \(ratingControl.value) star"
        default:
            self.title = "User Rating: \(ratingControl.value) stars"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

