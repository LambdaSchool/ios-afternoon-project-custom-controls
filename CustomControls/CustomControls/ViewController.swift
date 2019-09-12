//
//  ViewController.swift
//  CustomControls
//
//  Created by Ciara Beitel on 9/12/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
        navigationController?.title = "User Rating: \(ratingControl.value) star"
        } else {
            navigationController?.title = "User Rating: \(ratingControl.value) stars"
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

