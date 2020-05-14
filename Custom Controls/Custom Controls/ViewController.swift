//
//  ViewController.swift
//  Custom Controls
//
//  Created by Kelson Hartle on 5/13/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        title = "User Rating: N stars"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

