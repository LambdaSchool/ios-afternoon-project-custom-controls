//
//  ViewController.swift
//  Star Rating
//
//  Created by Nichole Davidson on 3/19/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let customControl = CustomControl()
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        if customControl.value < 2 {
            self.title = "User Rating: N star"
        } else {
            self.title = "User Rating: N stars"
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

