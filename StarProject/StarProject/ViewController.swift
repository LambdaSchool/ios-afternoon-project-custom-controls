//
//  ViewController.swift
//  StarProject
//
//  Created by Bradley Diroff on 3/19/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        if ratingControl.value == 1 {
            self.title = "User Rating: 1 star"
        } else {
            self.title = "User Rating: \(ratingControl.value) star"
        }
    }
    
    
}

