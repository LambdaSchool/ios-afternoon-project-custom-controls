//
//  ViewController.swift
//  StarRating
//
//  Created by Karen Rodriguez on 3/19/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        self.title = ratingControl.value == 1 ? "User Rating: \(ratingControl.value) star" : "User Rating: \(ratingControl.value) stars"
        
    }
    
}


